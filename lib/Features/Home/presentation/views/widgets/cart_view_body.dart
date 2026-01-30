import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/Core/constants/app_colors.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/checkout_view.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_minus_add_cubit/cart_minus_add_cubit.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_minus_add_cubit/cart_minus_add_states.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/customDivider.dart';
import 'package:fruits_hub/Shared/custom_button.dart';
import 'package:fruits_hub/Shared/error_success_snack_bar.dart';
import 'package:fruits_hub/Shared/internal_custom_app_bar.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/cubits/products_cubit.dart';
import '../../../../../Shared/get_user.dart';
import '../../view_model/cubits/cart_cubits/cart_cubit.dart';
import 'cart_item_list_view.dart';
import 'number_of_cart_products_widget.dart';

class CartViewBody extends StatelessWidget  {
   CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

        children: [

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: InternalCustomAppBar(text: "السلة", arrowVisible: true , showNotification: false,),
          ),
          Gap(16.h),
          NumberOfCartProductsWidget(),
          Gap(24.h),
          // Customdivider(),
          Expanded(

              child: CustomScrollView(slivers: [
                SliverToBoxAdapter(child:  context.read<CartCubit>().cartEntity.cartItems.isEmpty ? SizedBox() : Customdivider()),
                CartItemListView(cartItems: context.watch<CartCubit>().cartEntity.cartItems,),
                SliverToBoxAdapter(child:  context.read<CartCubit>().cartEntity.cartItems.isEmpty ? SizedBox() : Customdivider()),


              ])),

          Gap(24.h),
          BlocBuilder<CartMinusAddCubit , CartMinusAddStates>(
              builder: (context , state){
    return CustomButton(onPressed: ()async{
      // هنا نجيب اليوزر

      if( context.read<CartCubit>().cartEntity.cartItems.isNotEmpty){
        Navigator.pushNamed(context, CheckoutView.routeName , arguments: context.read<CartCubit>().cartEntity);
      }else{
        errorAndSuccessSnackBar(context,"لا يوجد منتجات في سلة التسوق " ,  Colors.grey.shade800);
      }
    }, text: "الدفع   ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()}جنيه");

    }),
          Gap(24.h),

        ],
      );

  }
}

