import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/Features/auth/domain/entities/user_entity.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/Features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.uId,
    super.photoUrl, // include photoUrl from UserEntity
    super.cartItems
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? "",
      email: user.email ?? "",
      uId: user.uid,
      photoUrl: user.photoURL ?? "",

      // Firebase user may have a photoURL
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      uId: json["uId"] ?? "",
      photoUrl: json["photoUrl"] ?? "", // ✅ map photoUrl from JSON
      cartItems: json["cartItems"] ?? []
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      name: user.name,
      email: user.email,
      uId: user.uId,
      photoUrl: user.photoUrl, // ✅ carry over photoUrl
      cartItems: user.cartItems
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "uId": uId,
      "photoUrl": photoUrl, // ✅ include photoUrl when saving
      "cartItems" : cartItems,
    };
  }
}
