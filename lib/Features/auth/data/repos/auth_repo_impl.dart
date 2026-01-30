import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_hub/Core/constants/constant.dart';
import 'package:fruits_hub/Core/errors/exceptions.dart';
import 'package:fruits_hub/Core/services/database_service.dart';
import 'package:fruits_hub/Core/services/firebase_auth_service.dart';
import 'package:fruits_hub/Core/services/prefs.dart';
import 'package:fruits_hub/Core/utils/backensd_endpoints.dart';
import 'package:fruits_hub/Features/auth/data/models/user_model.dart';
import 'package:fruits_hub/Features/auth/domain/repos/auth_repo.dart';

import '../../../../Core/errors/failures.dart';
import '../../domain/entities/user_entity.dart';

class AuthRepoImpl extends AuthRepo {
  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.databaseService,
  });

  FirebaseAuthService firebaseAuthService;

  final DatabaseService databaseService;

  ////// create User With Email And Password

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password, String name,) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserEmailAndPassword(
        email: email,
        password: password,
      );

      var userEntity = UserEntity(name: name, email: email, uId: user.uid);

      // This is storage data user
      await addUserData(user: userEntity);

      return right(userEntity);
    } on CustomExceptions catch (e) {
      await deleteUser(user);
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      await deleteUser(user);

      log(
        "Exception in AuthRepoImpl.create user with email password : ${e.toString()} ",
      );
      return left(ServerFailure(message: e.toString()));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  ////// log in with Email And Password

  @override
  Future<Either<Failure, UserEntity>> logInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(" sign in success");
      var userEntity = await getUserData(uid: user.uid);
      print(" get user success");

      await saveUserData(usr: userEntity);
      print(" save user data success");

      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      log(
        "Exception in AuthRepoImpl.sign in user with email password : ${e.toString()} ",
      );
      return left(ServerFailure(message: e.toString()));
    }
  }

  ////// log in with Google/////////////

  Future<Either<Failure, UserEntity>> logInWithGoogle() async {
    User? user;

    try {
      user = await firebaseAuthService.signInWithGoogle();

      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.checkIfDataExist(
        path: BackendEndpoints.isUserExist,
        documentId: userEntity.uId,
      );
      // This is storage data user

      if (isUserExist) {
        await getUserData(uid: userEntity.uId);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log(
        "Exception in AuthRepoImpl.sign in user with google: ${e.toString()} ",
      );
      return left(ServerFailure(message: e.toString()));
    }
  }

  ////// log In With Facebook/////////////////

  Future<Either<Failure, UserEntity>> logInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();

      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.checkIfDataExist(
        path: BackendEndpoints.isUserExist,
        documentId: userEntity.uId,
      );
      // This is storage data user

      if (isUserExist) {
        await getUserData(uid: userEntity.uId);
      } else {
        await addUserData(user: userEntity);
      }

      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      await deleteUser(user);

      log(
        "Exception in AuthRepoImpl.sign in user with facebook: ${e.toString()} ",
      );
      return left(ServerFailure(message: e.toString()));
    }
  }

  // Future addUserData({required UserEntity user} )async{
  //
  //      await databaseService.addData(
  //          path: BackendEndpoints.addUserData,
  //          data: UserModel.fromEntity(user).toMap(),
  //          // documentId: user.uId
  //
  //      );
  //
  // }
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoints.addUserData,
      documentId: user.uId, // ✅ مهم جدًا
      data: UserModel.fromEntity(user).toMap(),
    );
  }
  //
  // Future <UserEntity> getUserData({required String uid} )async{
  //
  //  var user = await databaseService.getData(path: BackendEndpoints.getUserData, documentId: uid);
  //
  //  return UserModel.fromJson(user);
  //
  // }

  // Future<UserEntity> getUserData({required String uid}) async {
  //   try {
  //     final user = await databaseService.getData(
  //       path: BackendEndpoints.getUserData,
  //       documentId: uid,
  //     );
  //
  //     return UserModel.fromJson(user);
  //
  //   } on Exception catch (e) {
  //
  //        throw CustomExceptions(message: e.toString());
  //
  //   }
  //
  //   // if (user == null) {
  //   //   throw CustomExceptions(message: 'User data not found');
  //   //
  //   // }
  //   //
  //   // return UserModel.fromJson(user);
  //
  // }

  Future<UserEntity> getUserData({required String uid}) async {
    final user = await databaseService.getData(
      path: BackendEndpoints.getUserData,
      documentId: uid,
    );

    if (user == null) {
      throw CustomExceptions(message: 'User data not found');
    }

    return UserModel.fromJson(user);
  }

  Future saveUserData({required UserEntity usr}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(usr).toMap());

    return await Prefs.setString(kUserData, jsonData);
  }
}
