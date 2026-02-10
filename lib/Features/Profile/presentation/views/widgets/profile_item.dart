import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';
import 'package:gap/gap.dart';

class ProfileItem extends StatelessWidget {
   ProfileItem({required this.icon  , required this.text , required this.onTap});

  IconData icon ;
  String text ;
   void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
       Icon(icon , color: const Color(0xFF1B5E37), size: 16.sp,) ,
        Gap(7.w),
        Text(
          text,
            style: TextStyles.semiBold13.copyWith( color: const Color(0xFF949D9E),height: 1.70,),

        ),
        Spacer(),
        GestureDetector(
            onTap:onTap ,
            child: Icon(Icons.arrow_forward_ios , color: Colors.black,)),

        
        
      ],
    );
  }
}
