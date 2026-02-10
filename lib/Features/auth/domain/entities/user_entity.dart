import 'package:fruits_hub/Features/Home/domain/entities/cart_item_entity.dart';

class UserEntity {
  UserEntity({
    required this.name,
    required this.email,
    required this.uId,
    this.photoUrl = "",
    this.cartItems ,
  });

  final String name;
  final String email;
  final String uId;
  final String photoUrl; // store URL string
  final List<CartItemEntity>? cartItems;

  UserEntity copyWith({
    String? uId,
    String? name,
    String? email,
    String? photoUrl,
    List<CartItemEntity>? cartItems
  }) {
    return UserEntity(
      uId: uId ?? this.uId,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      cartItems: cartItems ?? this.cartItems
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "uId": uId,
      "photoUrl": photoUrl,
      "cartItems" : cartItems,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      name: map["name"] ?? "",
      email: map["email"] ?? "",
      uId: map["uId"] ?? "",
      photoUrl: map["photoUrl"] ?? "",
      cartItems: map["cartItems"] ?? [],
    );
  }
}
