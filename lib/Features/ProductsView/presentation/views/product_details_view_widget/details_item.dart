import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/constants/textStyles.dart';

class DetailsItem extends StatelessWidget {
   DetailsItem({required this.text1, required this.text2 , required this.image});

  String text1 , text2 , image ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.h,
      width: 159.w,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: const Color(0xFFF1F1F5),
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                textAlign: TextAlign.right,
                style: TextStyles.bold16.copyWith( color: const Color(0xFF23AA49))
              ),
              Gap(4.h),

              Text(
                text2,
                textAlign: TextAlign.right,
                style: TextStyles.semiBold13.copyWith(color: const Color(0xFF969899) ,  height: 1.70,)
              )

            ],
          ),
Gap(11.w),
          SvgPicture.asset(image),



        ],
      ),
    );
  }
}
