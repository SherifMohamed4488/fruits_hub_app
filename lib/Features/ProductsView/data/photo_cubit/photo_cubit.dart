import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Core/services/database_service.dart';
import 'package:fruits_hub/Features/ProductsView/data/photo_cubit/photo_states.dart';

import '../../../../Core/constants/constant.dart';
import '../../../../Core/services/prefs.dart';
// class PhotoCubit extends Cubit<PhotoStates> {
//   final DatabaseService databaseService;
//
//   PhotoCubit(this.databaseService) : super(PhotoInitial());
//
//   Future<void> updatePhoto(File photoFile) async {
//     emit(PhotoLoading());
//
//     try {
//       // Upload photo to backend / Firebase Storage
//       final downloadUrl = await databaseService.updatePhoto(photoFile: photoFile);
//
//       // Update local cache
//       try {
//         final userJson = await Prefs.getString(kUserData);
//         if (userJson != null) {
//           final userMap = jsonDecode(userJson) as Map<String, dynamic>;
//           userMap["photoUrl"] = downloadUrl; // ✅ store URL string
//           await Prefs.setString(kUserData, jsonEncode(userMap));
//         }
//       } catch (cacheError) {
//         debugPrint("Cache update failed: $cacheError");
//       }
//
//       emit(PhotoSuccess(downloadUrl)); // pass URL in state
//     } catch (e, stack) {
//       debugPrint("UpdatePhoto failed: $e\n$stack");
//       emit(PhotoFailure(message: e.toString()));
//     }
//   }
//
//   /// Delete photo (reset photoUrl to empty string)
//   Future<void> deletePhoto() async {
//     emit(PhotoLoading());
//
//     try {
//       // Optionally delete from backend
//       await databaseService.deletePhoto();
//
//       // Clear local cache
//       final userJson = await Prefs.getString(kUserData);
//       if (userJson != null) {
//         final userMap = jsonDecode(userJson) as Map<String, dynamic>;
//         userMap["photoUrl"] = ""; // reset to empty string
//         await Prefs.setString(kUserData, jsonEncode(userMap));
//       }
//
//       emit(PhotoSuccess("")); // emit success with empty photoUrl
//     } catch (e, stack) {
//       debugPrint("DeletePhoto failed: $e\n$stack");
//       emit(PhotoFailure(message: e.toString()));
//     }
//   }
// }




class PhotoCubit extends Cubit<PhotoStates> {
  final DatabaseService databaseService;

  PhotoCubit(this.databaseService) : super(PhotoInitial());

  String _photoUrl = '';

  // ✅ used when loading cached user data
  void setInitialPhoto(String url) {
    _photoUrl = url;
    emit(PhotoSuccess(url));
  }

  // ✅ upload / update photo
  Future<void> updatePhoto(File photoFile) async {
    emit(PhotoLoading());

    try {
      final downloadUrl =
      await databaseService.updatePhoto(photoFile: photoFile);

      _photoUrl = downloadUrl;

      // Update local cache
      final userJson = await Prefs.getString(kUserData);
      if (userJson != null) {
        final userMap = jsonDecode(userJson) as Map<String, dynamic>;
        userMap["photoUrl"] = downloadUrl;
        await Prefs.setString(kUserData, jsonEncode(userMap));
      }

      emit(PhotoSuccess(downloadUrl));
    } catch (e, stack) {
      debugPrint("UpdatePhoto failed: $e\n$stack");
      emit(PhotoFailure(message: e.toString()));
    }
  }

  // ✅ delete photo
  Future<void> deletePhoto() async {
    emit(PhotoLoading());

    try {
      await databaseService.deletePhoto();

      _photoUrl = '';

      // Clear local cache
      final userJson = await Prefs.getString(kUserData);
      if (userJson != null) {
        final userMap = jsonDecode(userJson) as Map<String, dynamic>;
        userMap["photoUrl"] = "";
        await Prefs.setString(kUserData, jsonEncode(userMap));
      }

      // 🔥 المهم هنا
      emit(PhotoInitial());
    } catch (e, stack) {
      debugPrint("DeletePhoto failed: $e\n$stack");
      emit(PhotoFailure(message: e.toString()));
    }
  }

  // ✅ single source of truth
  bool get hasPhoto => _photoUrl.isNotEmpty;
}



// NOTICEE that i'm used updatePhoto as a name to upload photo in database because
// i'm give a initial value for photoUrl to can update on it only you know