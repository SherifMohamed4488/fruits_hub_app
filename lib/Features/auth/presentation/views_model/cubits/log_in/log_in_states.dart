import 'package:fruits_hub/Features/auth/domain/entities/user_entity.dart';

class LogInStates{}

class LogInInitial extends LogInStates{}
class LogInLoading extends LogInStates{}
class LogInSuccess extends LogInStates{

  final UserEntity userEntity ;

  LogInSuccess({required this.userEntity});
}
class LogInFailure extends LogInStates{

  final String message ;

  LogInFailure({required this.message});

}
