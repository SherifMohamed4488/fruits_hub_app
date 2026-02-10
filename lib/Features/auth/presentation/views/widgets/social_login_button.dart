import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';
import 'package:gap/gap.dart';

import '../../../../../gen/assets.gen.dart';

class SocialLogInButton extends StatelessWidget {
   SocialLogInButton({required this.image , required this.text , required this.onTap });

  String image , text ;
VoidCallback onTap ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(

          width: 343.w,
          height: 56.h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: const Color(0xFFDCDEDE),
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
      ),

          child: Center(
            child: Row(
            children: [
              Gap(20.w),
              SvgPicture.asset(image,height: 20.h, width: 20.w,),
      Spacer(flex: 1,),
              Text(text, style: TextStyles.semiBold16.copyWith(height: 1.40 ,  color: const Color(0xFF0C0D0D) ),
              ),
              Spacer(flex: 2,)
                  ],
                ),
          ),
      //   child: ListTile(
      //
      //
      //     leading: SvgPicture.asset(image),
      //
      //     title: Text(text , style: TextStyles.semiBold16.copyWith(height: 1.40 ,  color: const Color(0xFF0C0D0D),),
      //   ),
      // )
      ),
    );
  }
}
