

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/Features/auth/presentation/views_model/cubits/sign_up_cubit/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates>{

  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final AuthRepo authRepo ;
  Future<void> createUserWithEmailAndPassword(String email , String password , String name) async{

    emit(SignUpLoading());
final result  = await authRepo.createUserWithEmailAndPassword(email, password, name);

result.fold((failure) => emit(SignUpFailure(message: failure.message)), (userEntity) => emit(SignUpSuccess(userEntity: userEntity)));

  }
}