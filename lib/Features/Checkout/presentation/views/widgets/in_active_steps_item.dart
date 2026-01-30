import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/constants/textStyles.dart';

class InActiveStepsItem extends StatelessWidget {

  InActiveStepsItem({required this.text , required this.index});

  String text , index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 13.r,

          backgroundColor: const Color(0xFFF2F3F3),
          child: Text(
            index,
            style: TextStyles.semiBold13.copyWith(
              height: 1.60,
              color: const Color(0xFF0C0D0D),
            ),
          ),
        ),

        Gap(4.w),
        Text(
          text,
          style: TextStyles.bold13.copyWith(color: const Color(0xFFAAAAAA)),
        ),
      ],
    );
    ;
  }
}
