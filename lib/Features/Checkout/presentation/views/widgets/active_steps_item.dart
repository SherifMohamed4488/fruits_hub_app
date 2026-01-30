import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/constants/app_colors.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';
import 'package:gap/gap.dart';

class ActiveStepsItem extends StatelessWidget {
  final String text;

  const ActiveStepsItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 13.r,
          backgroundColor: AppColors.PrimaryColor,
          child: Icon(Icons.check, color: Colors.white, size: 18.sp),
        ),
        Gap(4.w),
        Text(
          text,
          style: TextStyles.bold13.copyWith(color: const Color(0xFF1B5E37)),
        ),
      ],
    );
  }
}
