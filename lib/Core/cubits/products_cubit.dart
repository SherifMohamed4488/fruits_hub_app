
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Core/cubits/products_states.dart';
import 'package:fruits_hub/Core/entities/product_entity.dart';
import 'package:fruits_hub/Core/repos/product_repo.dart';
import 'package:fruits_hub/Features/auth/domain/repos/auth_repo.dart';


class ProductsCubit extends Cubit<ProductsStates>{

  ProductsCubit(this.productRepo) : super(ProductsInitial());

  final ProductRepo productRepo ;
  int productsLength = 0 ;

  Future<void> getProducts() async{
    emit(ProductsLoading());

    var products = await productRepo.getProducts();
    products.fold(

      (failure) => emit(ProductsFailure(message: failure.message)),
            (products) {

          productsLength += products.length;

          emit(ProductsSuccess(products: products));
        }
    );
  }

  List<ProductEntity>? _cachedBestSelling;
  bool _isFetchingBestSelling = false;

  Future<void> getBestSellingProducts({bool forceRefresh = false}) async {
    // لو عندنا داتا كاش ومش عايزين refresh → Success فورًا
    if (_cachedBestSelling != null && !forceRefresh) {
      emit(ProductsSuccess(products: _cachedBestSelling!));
      return;
    }

    // لو فيه fetch شغال بالفعل → ما تعملش حاجة
    if (_isFetchingBestSelling) return;

    _isFetchingBestSelling = true;

    // ❌ ما تعملش Loading لو فيه كاش
    if (_cachedBestSelling == null) {
      emit(ProductsLoading());
    }

    final result = await productRepo.getBestSellingProduct();

    result.fold(
          (failure) {
        _isFetchingBestSelling = false;
        emit(ProductsFailure(message: failure.message));
      },
          (products) {
        _cachedBestSelling = products;
        _isFetchingBestSelling = false;
        emit(ProductsSuccess(products: products));
      },
    );
  }
  }


  // Future<void> getBestSellingProducts() async{
  //   emit(ProductsLoading());
  //
  //   var products = await productRepo.getBestSellingProduct();
  //
  //   products.fold(
  //
  //           (failure) => emit(ProductsFailure(message: failure.message)),
  //           (products) {
  //             productsLength += products.length;
  //             emit(ProductsSuccess(products: products));
  //           }
  //           );
  // }

