
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/constants/textStyles.dart';
import '../../view_model/cubits/cart_cubits/cart_cubit.dart';

class NumberOfCartProductsWidget extends StatelessWidget {
  const NumberOfCartProductsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      padding:  EdgeInsets.symmetric(horizontal: 91.w, vertical: 10.h),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFEBF9F1) /* Green1-50 */,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          Text(
            'لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق',
            style: TextStyles.regular13.copyWith(height: 1.60,)
          ),
        ],
      ),
    );
  }
}
