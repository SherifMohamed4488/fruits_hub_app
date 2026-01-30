import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/constants/app_colors.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/widgets/active_shipping_item_dot.dart';
import 'package:gap/gap.dart';

import 'in_active_shipping_item_dot.dart';


class ShippingItem extends StatelessWidget {
   ShippingItem({required this.title , required this.subtitle ,
     required this.price , required this.isSelected , required this.onTap});
String title , subtitle , price;
bool isSelected ;
   VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 50),
        width: 343.w,
        height: 81.h,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x33D9D9D9),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: isSelected ? AppColors.PrimaryColor : Colors.transparent /* Grayscale-400 */,
              ),
              borderRadius: BorderRadius.circular(4)),
        ),
        child: Padding(
          padding:  EdgeInsets.only(top: 16.h , right: 5.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSelected ? ActiveShippingItemDot() : InActiveShippingItemDot(),

              Gap(10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:TextStyles.regular14.copyWith( height: 1.60,
                color: Colors.black,)
                  ),

          Gap(6.h),
                  Text(
                    subtitle,
                    textAlign: TextAlign.right,
                    style: TextStyles.regular14.copyWith( height: 1.60,
                      color: Colors.black.withValues(alpha: 0.50),)
                  ),

                ],
              ),

          Spacer(),
              Padding(
                padding:  EdgeInsets.only(bottom: 28.5.h , top: 12.5.h),
                child: Text(
                    price,
                    style: TextStyles.bold13.copyWith( color: const Color(0xFF3A8B33),)
                ),
              ),
              Gap(13.w),
            ],
          ),
        ),
      ),
    );
  }
}
