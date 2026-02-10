import 'dart:convert';

import 'package:fruits_hub/Core/constants/constant.dart';
import 'package:fruits_hub/Core/services/prefs.dart';
import 'package:fruits_hub/Features/auth/data/models/user_model.dart';
import 'package:fruits_hub/Features/auth/domain/entities/user_entity.dart';

// UserEntity? getUser() {
//   final jsonString = Prefs.getString(kUserData);
//
//   if (jsonString == null) return null;
//
//   return UserModel.fromJson(jsonDecode(jsonString));
// }



Stream<UserEntity?> getUser2() async* {
  final jsonString = await Prefs.getString(kUserData);
  if (jsonString == null || jsonString.isEmpty) {
    yield null;
    return; // stop here
 }
 yield UserModel.fromJson(jsonDecode(jsonString));

}



Future<UserEntity?> getUser() async {
  final jsonString = await Prefs.getString(kUserData);

  if (jsonString == null || jsonString.isEmpty) {
    return null;
  }

  return UserModel.fromJson(jsonDecode(jsonString));
}
