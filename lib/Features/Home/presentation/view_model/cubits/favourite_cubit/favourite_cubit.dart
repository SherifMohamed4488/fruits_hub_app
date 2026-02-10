import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/Core/entities/product_entity.dart';
import 'package:fruits_hub/Core/utils/backensd_endpoints.dart';
import 'favourite_states.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  /// Get current favourites list from state
  List<ProductEntity> get items {
    if (state is FavouriteUpdated) {
      return (state as FavouriteUpdated).items;
    }
    return [];
  }
  bool isFav(ProductEntity product) { return items.any((p) => p.promoCode == product.promoCode); }
  /// 🔥 Listen to favourites in Firestore (private per user)
  void startFavouritesListener() {
    print("User when starting listener: ${FirebaseAuth.instance.currentUser}");

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      print("⚠ No user logged in. Favourites listener not started.");
      return;
    }

    emit(FavouriteLoading());
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection(BackendEndpoints.addFavourite)
        .orderBy('createdAt')
        .snapshots()
        .listen((snapshot) {
      final favouriteItems = snapshot.docs.map((doc) {
        final data = doc.data();
        return ProductEntity(
          productName: data['productName'],
          promoCode: data['promoCode'],
          price: data['price'],
          desc: data['desc'],
          isFeatured: data['isFeatured'] ?? false,
          imageUrl: data['imageUrl'],
          expirartionMounths: data['expirartionMounths'],
          isOrganic: data['isOrganic'] ?? false,
          numberOfCalories: data['numberOfCalories'],
          unitAmount: data['unitAmount'],
          reviews: [], // map ReviewEntity if stored
        );
      }).toList();

      emit(FavouriteUpdated(favouriteItems));
    }, onError: (error) {
      emit(FavouriteError("Failed to listen to favourites: $error"));
    });
  }

  /// ✅ Add product to favourites
  Future<void> addToFavourites(ProductEntity product) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final safeId = product.promoCode; // unique identifier

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection(BackendEndpoints.addFavourite)
          .doc(safeId)
          .set({
        'productName': product.productName,
        'promoCode': product.promoCode,
        'price': product.price,
        'desc': product.desc,
        'isFeatured': product.isFeatured,
        'imageUrl': product.imageUrl,
        'expirartionMounths': product.expirartionMounths,
        'isOrganic': product.isOrganic,
        'numberOfCalories': product.numberOfCalories,
        'unitAmount': product.unitAmount,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      emit(FavouriteError("Failed to add product: $e"));
    }
  }

  /// ❌ Remove product from favourites
  Future<void> removeFromFavourites(ProductEntity product) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final safeId = product.promoCode;

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection(BackendEndpoints.addFavourite)
          .doc(safeId)
          .delete();
    } catch (e) {
      emit(FavouriteError("Failed to remove product: $e"));
    }
  }

  /// Count favourites
  int get favouritesCount {
    if (state is FavouriteUpdated) {
      return (state as FavouriteUpdated).items.length;
    }
    return 0;
  }
}
