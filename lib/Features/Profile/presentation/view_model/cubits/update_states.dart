import 'package:fruits_hub/Features/auth/domain/entities/user_entity.dart';

abstract class UpdateStates {}

class UpdateInitial extends UpdateStates {}

class UpdateLoading extends UpdateStates {}

/// حالة عند تحميل المستخدم أول مرة من SharedPreferences
class UpdateLoaded extends UpdateStates {
  final UserEntity user;
  UpdateLoaded({required this.user});
}

/// حالة عند نجاح تحديث بيانات المستخدم (مثلاً تغيير الاسم)
class UpdateSuccess extends UpdateStates {
  // final UserEntity user;
  // UpdateSuccess({required this.user});
}

class UpdateFailure extends UpdateStates {
  final String message;
  UpdateFailure({required this.message});
}
