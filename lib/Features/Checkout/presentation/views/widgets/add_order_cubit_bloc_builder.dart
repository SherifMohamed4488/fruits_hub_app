import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Features/Checkout/presentation/view_model/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_hub/Features/Checkout/presentation/view_model/add_order_cubit/add_order_states.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_hub/Shared/error_success_snack_bar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
   AddOrderCubitBlocBuilder({ required this.widget});

  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit , AddOrderStates>(
        listener: (context , state){
          if(state is AddOrderSuccess){
            return errorAndSuccessSnackBar(context, "تمت العمليه بنجاح", Colors.green);

          }

          if ( state is AddOrderFailure){
            return errorAndSuccessSnackBar(context, state.message, Colors.green);
          }
        },
        builder: (context , state){

      return ModalProgressHUD(inAsyncCall: state is AddOrderLoading, child: widget);


    },


    );
  }
}
