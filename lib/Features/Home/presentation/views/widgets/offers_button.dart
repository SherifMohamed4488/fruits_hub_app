import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';

class OffersButton extends StatelessWidget {
  Color background , textColor ;

   Function() onTap ;

  OffersButton({required this.background , required this.textColor , required this.onTap });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 116.w,
        height: 32.h,
        padding:  EdgeInsets.all(3.sp),
        decoration: ShapeDecoration(
          color: background,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        ),

        child: Center(
          child: Text(
            'تسوق الان',
            style: TextStyles.bold13.copyWith(color: textColor)
          ),
        ),
      ),
    );
  }
}
