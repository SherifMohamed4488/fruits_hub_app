import 'package:fruits_hub/Features/auth/domain/entities/user_entity.dart';

class SignUpStates{}

class SignUpInitial extends SignUpStates{}
class SignUpLoading extends SignUpStates{}
class SignUpSuccess extends SignUpStates{

 final UserEntity userEntity ;

  SignUpSuccess({required this.userEntity});
}
class SignUpFailure extends SignUpStates{

  final String message ;

  SignUpFailure({required this.message});

}
