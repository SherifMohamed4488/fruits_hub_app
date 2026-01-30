import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/constants/app_colors.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only( left: 4.w ),
      child: SizedBox(
        width: 270.w,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: TextStyles.semiBold13.copyWith(height: 1.70, color: const Color(0xFF616A6B))
              ),
              TextSpan(
                  text: 'الشروط والأحكام',
                  style: TextStyles.semiBold13.copyWith(height: 1.70, color: AppColors.LightPrimaryColor)

              ),
              TextSpan(
                  text: ' الخاصة ',
                  style: TextStyles.semiBold13.copyWith(height: 1.70, color: AppColors.LightPrimaryColor)

              ),
              TextSpan(
                  text: 'بنا',
                  style: TextStyles.semiBold13.copyWith(height: 1.70, color: AppColors.LightPrimaryColor)


              ),
            ],
          ),
        ),
      ),
    );
  }
}
