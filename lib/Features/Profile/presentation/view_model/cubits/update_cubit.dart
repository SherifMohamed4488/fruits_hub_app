import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Core/constants/constant.dart';
import 'package:fruits_hub/Core/services/database_service.dart';
import 'package:fruits_hub/Features/Profile/presentation/view_model/cubits/update_states.dart';
import 'package:fruits_hub/Features/auth/domain/repos/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../Core/errors/failures.dart';
import '../../../../../Core/services/prefs.dart';
import '../../../../../Shared/get_user.dart';
import '../../../../auth/domain/entities/user_entity.dart';
//
class UpdateCubit extends Cubit<UpdateStates> {
  final DatabaseService databaseService;
  final AuthRepo authRepo;

  UpdateCubit(this.databaseService, this.authRepo) : super(UpdateInitial());

  Future<void> updateUserName({required String name}) async {
    emit(UpdateLoading());
    try {
      // 1. Update Firestore
      await databaseService.updateUserName(name: name);

      // 2. Update local cache safely
      try {
        final userJson = await Prefs.getString(kUserData); // ✅ await here
        if (userJson != null) {
          final userMap = jsonDecode(userJson) as Map<String, dynamic>;
          userMap["name"] = name;
          await Prefs.setString(kUserData, jsonEncode(userMap));
        }
      } catch (cacheError) {
        print("Cache update failed: $cacheError");
        // Don’t emit failure here — Firestore update succeeded
      }

      // 3. Emit success
      emit(UpdateSuccess());
    } catch (e, stack) {
      print("UpdateUserName failed: $e\n$stack");
      emit(UpdateFailure(message: e.toString()));
    }
  }

  Future<void> updateUserEmail({required String email}) async {
    emit(UpdateLoading());
    try {
      // 1. Update Firestore
      await databaseService.updateUserEmail(email: email);

      // 2. Update local cache safely
      try {
        final userJson = await Prefs.getString(kUserData); // ✅ await here
        if (userJson != null) {
          final userMap = jsonDecode(userJson) as Map<String, dynamic>;
          userMap["email"] = email;
          await Prefs.setString(kUserData, jsonEncode(userMap));
        }
      } catch (cacheError) {
        print("Cache update failed: $cacheError");
        // Don’t emit failure here — Firestore update succeeded
      }

      // 3. Emit success
      emit(UpdateSuccess());
    } catch (e, stack) {
      print("UpdateUserName failed: $e\n$stack");
      emit(UpdateFailure(message: e.toString()));
    }
  }


  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    emit(UpdateLoading());

    try {
      await authRepo.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
      emit(UpdateSuccess());
    } on ServerFailure catch (e) {
      emit(UpdateFailure(message: e.message));
    } on FirebaseAuthException catch (e) {
      emit(UpdateFailure(message: e.message ?? "Password change failed"));
    }
  }
}
//   Future<void> changePassword({required String oldPassword, required String newPassword})async {
//     emit(UpdateLoading());
//
//     try {
//
//       await authRepo.changePassword(oldPassword: oldPassword, newPassword: newPassword);
//       emit(UpdateSuccess());
//
//     }  on FirebaseAuthException catch (e) {
//       emit(UpdateFailure(message: e.toString()));
//     }
//   }
// }

// class UpdateCubit extends Cubit<UpdateStates> {
//   final DatabaseService databaseService;
//   UserEntity? currentUser;
//
//   UpdateCubit(this.databaseService) : super(UpdateInitial());
//
//   Future<void> updateUserName({required String name}) async {
//     emit(UpdateLoading());
//     try {
//       await databaseService.updateUserName(name: name);
//
//       if (currentUser != null) {
//         currentUser = currentUser!.copyWith(name: name);
//         await Prefs.setString(kUserData, jsonEncode(currentUser!.toMap()));
//         emit(UpdateSuccess(user: currentUser!));
//       } else {
//         // reload from SharedPreferences if currentUser is null
//         final user = await getUser();
//         if (user != null) {
//           currentUser = user.copyWith(name: name);
//           await Prefs.setString(kUserData, jsonEncode(currentUser!.toMap()));
//           emit(UpdateSuccess(user: currentUser!));
//         } else {
//           emit(UpdateFailure(message: "No user loaded"));
//         }
//       }
//     } catch (e) {
//       emit(UpdateFailure(message: e.toString()));
//     }
//   }
//
// }


// class UpdateCubit extends Cubit<UpdateStates> {
//   final DatabaseService databaseService;
//
//   UpdateCubit(this.databaseService) : super(UpdateInitial());
//
//   UserEntity? currentUser;
//
//   Future<void> loadUser() async {
//     emit(UpdateLoading());
//     try {
//       currentUser = await getUser(); // from SharedPreferences
//       emit(UpdateSuccess(user: currentUser!));
//     } catch (e) {
//       emit(UpdateFailure(message: e.toString()));
//     }
//   }
//
//   Future<void> updateUserName({required String name}) async {
//     if (currentUser == null) return;
//
//     emit(UpdateLoading());
//
//     try {
//       await databaseService.updateUserName(name: name);
//
//       currentUser = currentUser!.copyWith(name: name);
//
//       await Prefs.setString(
//         kUserData,
//         jsonEncode(currentUser!.toMap()),
//       );
//
//       emit(UpdateSuccess(user: currentUser!));
//     } catch (e) {
//       emit(UpdateFailure(message: e.toString()));
//     }
//   }
// }


// class UpdateCubit extends Cubit<UpdateStates> {
//   final DatabaseService databaseService;
//   StreamSubscription<UserEntity>? _subscription;
//
//   UpdateCubit(this.databaseService) : super(UpdateInitial());
//
//   UserEntity? currentUser;
//
//   Future<void> loadUser() async {
//     emit(UpdateLoading());
//     try {
//       currentUser = await getUser(); // من SharedPreferences
//       if (currentUser != null) {
//         emit(UpdateLoaded(user: currentUser!));
//         // ابدأ الاستماع للتغييرات من Firestore
//         listenToUser(currentUser!.uId);
//       } else {
//         emit(UpdateFailure(message: "No user found"));
//       }
//     } catch (e) {
//       emit(UpdateFailure(message: e.toString()));
//     }
//   }
//
//   void listenToUser(String uid) {
//     _subscription = databaseService.userStream(uid).listen((user) {
//       currentUser = user;
//       emit(UpdateSuccess(user: user)); // أي تغيير في Firestore يبعث حالة جديدة
//     });
//   }
//
//   Future<void> updateUserName({required String name}) async {
//     if (currentUser == null) return;
//
//     emit(UpdateLoading());
//     try {
//       await databaseService.updateUserName(name: name);
//       // مش محتاج تعمل emit هنا، الـ stream هيبعث الحالة الجديدة تلقائيًا
//     } catch (e) {
//       emit(UpdateFailure(message: e.toString()));
//     }
//   }
//
//   @override
//   Future<void> close() {
//     _subscription?.cancel();
//     return super.close();
//   }
// }




// class UpdateCubit extends Cubit<UpdateStates> {
//   final DatabaseService databaseService;
//
//   UpdateCubit(this.databaseService) : super(UpdateInitial());
//
//   Future<void> loadUser() async {
//     emit(UpdateLoading());
//     try {
//       final user = await getUser();
//       emit(UpdateLoaded(user!));
//     } catch (e) {
//       emit(UpdateError(e.toString()));
//     }
//   }
//
//   Future<void> updateUserName({required String name}) async {
//     if (state is! UpdateLoaded) return;
//
//     final currentUser = (state as UpdateLoaded).user;
//
//     try {
//       await databaseService.updateUserName(name: name);
//
//       // 🔥 تحديث فوري للـ UI
//       emit(UpdateLoaded(
//         currentUser.copyWith(name: name),
//       ));
//     } catch (e) {
//       emit(UpdateError(e.toString()));
//     }
//   }
// }
