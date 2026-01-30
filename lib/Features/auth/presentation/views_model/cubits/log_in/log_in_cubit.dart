
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Features/auth/domain/repos/auth_repo.dart';

import 'log_in_states.dart';

class LogInCubit extends Cubit<LogInStates>{

  LogInCubit(this.authRepo) : super(LogInInitial());

  final AuthRepo authRepo ;
  Future<void> logInWithEmailAndPassword(String email , String password ) async{

    emit(LogInLoading());
    final result  = await authRepo.logInWithEmailAndPassword(email, password,);

    result.fold((failure) => emit(LogInFailure(message: failure.message)), (userEntity) => emit(LogInSuccess(userEntity: userEntity)));

  }

  Future<void> logInWithGoogle() async{

    emit(LogInLoading());
    final result  = await authRepo.logInWithGoogle();

    result.fold((failure) => emit(LogInFailure(message: failure.message)), (userEntity) => emit(LogInSuccess(userEntity: userEntity)));

  }


  Future<void> logInWithFacebook() async{

    emit(LogInLoading());
    final result  = await authRepo.logInWithFacebook();

    result.fold((failure) => emit(LogInFailure(message: failure.message)), (userEntity) => emit(LogInSuccess(userEntity: userEntity)));

  }
}