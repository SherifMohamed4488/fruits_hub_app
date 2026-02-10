import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../../Features/auth/domain/entities/user_entity.dart';

abstract class DatabaseService {

Future <void> addData ({ required String path, required Map<String, dynamic> data , String? documentId});
Future <dynamic> getData ({ required String path ,  String? documentId , Map<String, dynamic>?  query});
Future <bool> checkIfDataExist ({ required String path , required String documentId});
Future updateUserName({required String name});
Future updateUserEmail({required String email});
Future updatePhoto({required File photoFile});
Future <void> deletePhoto();


// Stream<UserEntity> userStream(String uid);

}
