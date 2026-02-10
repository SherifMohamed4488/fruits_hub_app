import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_cubits/cart_cubit.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_minus_add_cubit/cart_minus_add_cubit.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_minus_add_cubit/cart_minus_add_states.dart';
import 'package:gap/gap.dart';
import 'package:path/path.dart';

import '../../../../../Core/constants/textStyles.dart';
import '../../../domain/entities/cart_item_entity.dart';
import 'cart_item_minus_add_buttons.dart';

class CartItem extends StatelessWidget {
   CartItem({required this.cartItemEntity});
CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartMinusAddCubit , CartMinusAddStates>(
      buildWhen: (prev , current){
        if (current is CartMiCartMinusAddUpdtaed){
          if(current.cartItemEntity == cartItemEntity){
            return true;
          }
        }
        return false;
      },
      builder: (context , state){

        return Row(
          children: [
            Container(
              width: 72.w,
              height: 92.h,
              decoration: BoxDecoration(color: const Color(0xFFF3F5F7)),
              child: Padding(
                padding:  EdgeInsets.all(8.0.sp),
                child: Image.network(cartItemEntity.productEntity.imageUrl?? "https://th.bing.com/th/id/OIP.nRRnjzUxCAAN9Kz4XnLugQHaFj?w=271&h=203&c=7&r=0&o=7&pid=1.7&rm=3"),
              ) ,
              // Image.asset("assets/images/wtaermelon2_icon.png")

            ),
            Gap(17.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItemEntity.productEntity.productName,
                  style: TextStyles.bold13.copyWith( color: const Color(0xFF05161B) ),

                ),
                Gap(6.h),
                Text(
                    '${cartItemEntity.quantity}ك',
                    textAlign: TextAlign.right,
                    style: TextStyles.bold13.copyWith(color: const Color(0xFFF4A91F) , height: 1.60)
                ),
                Gap(10.h),
                CartItemMinusAddButtons(cartItemEntity: cartItemEntity,),
              ],
            ),
            Spacer()   ,     Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                    onTap:  (){

                      context.read<CartCubit>().deleteCartItem(cartItemEntity);
                    },
                    child: Icon(CupertinoIcons.trash, color: Colors.grey,)),
                Gap(29.h),

                Text("${cartItemEntity.calculateTotalPrice()} جنيه" , style: TextStyles.bold16.copyWith(color: const Color(0xFFF4A91F)),),




              ],)
          ],
        );

      }

    );

  }
}
