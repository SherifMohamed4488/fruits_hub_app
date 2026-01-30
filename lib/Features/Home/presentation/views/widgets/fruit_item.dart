import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';
import 'package:fruits_hub/Core/entities/product_entity.dart';
import 'package:gap/gap.dart';

import '../../view_model/cubits/cart_cubits/cart_cubit.dart';

class FruitItem extends StatelessWidget {
   FruitItem({required this.productEntity});

ProductEntity productEntity ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 172.w,
      height: 225.h,
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      ),

      child: Padding(
        padding:  EdgeInsets.all(8.sp),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Gap(5.h),
            Icon(CupertinoIcons.heart , color: const Color(0xFF292D32),),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 24.w),
              child: Image.network(productEntity.imageUrl ?? "https://th.bing.com/th/id/OIP.nRRnjzUxCAAN9Kz4XnLugQHaFj?w=271&h=203&c=7&r=0&o=7&pid=1.7&rm=3", height: 105.h, width: 114.w,),
            ),
            // Gap(24.h),
Spacer(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          productEntity.productName,
                          textAlign: TextAlign.right,
                          style: TextStyles.semiBold13.copyWith(

                            color: const Color(0xFF0C0D0D),
                            height: 1.70,
                          )
                      ),
                      Gap(2.h),
                      Text(

                          '${productEntity.price}جنية / الكيلو ',
                          style: TextStyles.semiBold13.copyWith(

                            color: const Color(0xFFF4A91F),
                            height: 1.70,
                          )
                      ),
                    ],
                  ),
// Gap(15.w),
                  Spacer(),

                  GestureDetector(
                    onTap: (){
                      context.read<CartCubit>().addProduct(productEntity);

                    },
                    child: CircleAvatar(
                      radius: 20.sp,
                      backgroundColor: const Color(0xFF1B5E37),
                      child: Icon(CupertinoIcons.add , color: Colors.white,),
                    ),
                  ),

                ],


              ),
            ),
Spacer(),
          ],
        ),
      ),
    );
  }
}
