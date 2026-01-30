import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Features/Home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_minus_add_cubit/cart_minus_add_cubit.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
   CartView();
  static const routeName = "cart";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=> CartMinusAddCubit(),
        child: Scaffold(body: SafeArea(child: CartViewBody())));
  }
}
