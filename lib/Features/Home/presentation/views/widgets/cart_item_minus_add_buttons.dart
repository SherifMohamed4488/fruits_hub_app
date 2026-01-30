import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Features/Home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_minus_add_cubit/cart_minus_add_cubit.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/constants/textStyles.dart';

class CartItemMinusAddButtons extends StatelessWidget {
   CartItemMinusAddButtons({required this.cartItemEntity});

  CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        GestureDetector(
          onTap: (){
            cartItemEntity.increaseCount();
            context.read<CartMinusAddCubit>().updateCartItem(cartItemEntity);
          },
          child: Container(
              width: 24.w,
              height: 24.h,
              decoration: ShapeDecoration(
                color: const Color(0xFF1B5E37) /* Green1-500 */,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child:Icon(CupertinoIcons.add, color: Colors.white, size: 16.sp,)
          ),
        ),
        Gap(15.w),
        Text(
            cartItemEntity.quantity.toString(),
            textAlign: TextAlign.center,
            style:TextStyles.bold16.copyWith(color: const Color(0xFF06140C))
        ),
        Gap(15.w),

        GestureDetector(
          onTap: (){
            cartItemEntity.decreaseQuantity();
            context.read<CartMinusAddCubit>().updateCartItem(cartItemEntity);

          },
          child: Container(
              width: 24.w,
              height: 24.h,
              decoration: ShapeDecoration(
                color: const Color(0xFFF3F5F7),
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0xFFF1F1F5),
                    ),
                    borderRadius: BorderRadius.circular(100)),
              ),
              child:Icon(CupertinoIcons.minus,   color: const Color(0xFF969899), size: 16.sp,)
          ),
        ),
      ],
    );
  }
}
