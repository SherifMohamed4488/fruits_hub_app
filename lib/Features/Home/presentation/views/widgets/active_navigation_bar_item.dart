import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/constants/textStyles.dart';

class ActiveNavigationBarItem extends StatelessWidget {
  ActiveNavigationBarItem({required this.text , required this.image});

  String image , text ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:  EdgeInsets.only(right: 0.w , ),
        child: Container(


          decoration: ShapeDecoration(
            color: const Color(0xFFEEEEEE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
          ),

          child: Padding(
            padding:  EdgeInsets.only(left: 10.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1B5E37) /* Green1-500 */,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
                  ),
                  child: Center(child: SvgPicture.asset(image)),
                ),
            Gap(4.w),
                Flexible(

                  child: Text(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.semiBold11.copyWith( color: const Color(0xFF1B5E37)  , height: 1.40)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}