import 'package:fruits_hub/Features/auth/domain/entities/user_entity.dart';

class AddOrderStates{}

class AddOrderInitial extends AddOrderStates{}
class AddOrderLoading extends AddOrderStates{}
class AddOrderSuccess extends AddOrderStates{}
class AddOrderFailure extends AddOrderStates{

  final String message ;

  AddOrderFailure({required this.message});

}
