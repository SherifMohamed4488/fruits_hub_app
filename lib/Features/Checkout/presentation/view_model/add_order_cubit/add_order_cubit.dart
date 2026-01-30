
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Features/Checkout/presentation/view_model/add_order_cubit/add_order_states.dart';
import 'package:fruits_hub/Features/auth/domain/repos/auth_repo.dart';

import '../../../../../Core/repos/order_repo/order_repo.dart';
import '../../../domain/order_entity.dart';


class AddOrderCubit extends Cubit<AddOrderStates>{

  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());

  final OrderRepo orderRepo ;
  void addOrder({required OrderEntity order}) async{

    emit(AddOrderLoading());
    final result  = await orderRepo.addOrder(order: order);

    result.fold((failure) => emit(AddOrderFailure(message: failure.message)),
            (success) => emit(AddOrderSuccess()),
    );

  }


}