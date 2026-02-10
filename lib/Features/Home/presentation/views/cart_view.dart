import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Features/Home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_minus_add_cubit/cart_minus_add_cubit.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/cart_view_body.dart';

import '../../../../Core/constants/textStyles.dart';

class CartView extends StatelessWidget {
   CartView();
  static const routeName = "cart";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=> CartMinusAddCubit(),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                'السلة',
                style: TextStyles.bold19.copyWith(color: const Color(0xFF0C0D0D)),
              ),
            ),
            body: SafeArea(child: CartViewBody())));
  }
}
