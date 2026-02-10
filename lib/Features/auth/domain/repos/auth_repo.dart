import 'package:dartz/dartz.dart';
import 'package:fruits_hub/Core/errors/failures.dart';
import 'package:fruits_hub/Features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo{

  Future<Either<Failure , UserEntity>> createUserWithEmailAndPassword(String email , String password , String name );
  Future<Either<Failure , UserEntity>> logInWithEmailAndPassword(String email , String password );
  Future<Either<Failure , UserEntity>> logInWithGoogle();
  Future<Either<Failure , UserEntity>> logInWithFacebook();

  Future addUserData({required UserEntity user});
  Future<UserEntity>getUserData({required String uid});
  Future saveUserData({required UserEntity usr});
  Future<void> changePassword({required String oldPassword, required String newPassword,}) ;
  // Future updateUserName({required String name});
Future<void> logout();



}