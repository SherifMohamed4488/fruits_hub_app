import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/constants/app_colors.dart';

import '../Core/constants/textStyles.dart';

class CustomButton extends StatelessWidget {
   CustomButton({required this.onPressed , required this.text});
VoidCallback? onPressed;
String text ;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 343.w,
        height: 54.h,
        padding:  EdgeInsets.symmetric(horizontal: 48.w, vertical: 15.h),
    decoration: ShapeDecoration(
    color: const Color(0xFF1B5E37) /* Green1-500 */,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.r),
    )),

    child: GestureDetector(


        onTap: onPressed,
        child: Center(
          child: Text(
            text,
            style: TextStyles.bold16.copyWith(color: Colors.white),
          ),
        ),

      ),
    );
  }
}
