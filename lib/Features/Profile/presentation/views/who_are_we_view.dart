import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../Core/constants/textStyles.dart';

class WhoAreWeView extends StatelessWidget {
  const WhoAreWeView({super.key});

  static const routeName = "who_are_we";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
    
            child: Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title: Text(
          'من نحن',
          textAlign: TextAlign.center,
          style: TextStyles.bold19.copyWith(color: Colors.black),
    
        ),
      ),
    
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(16.sp),
          child: Container(
            width: 343.w,
            height: 652.h,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              shadows: [
                BoxShadow(
                  color: Color(0x337090B0),
                  blurRadius: 40,
                  offset: Offset(0, 16),
                  spreadRadius: 0,
                ),
            
              ],
            ),
            
            child:  Padding(
              padding:  EdgeInsets.all(16.sp),
              child: Column(
                children:[
            
                  Text(
                      'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص',
                      textAlign: TextAlign.justify,
                      style: TextStyles.regular13.copyWith(color: const Color(0xFF949D9E) , height: 1.60)
                  ),
                  Gap(20.h),
            
                  Text(
                    'هنالك العديد من الأنواع المتوفرة لنصوص لوريم إيبسوم، ولكن الغالبية تم تعديلها بشكل ما عبر إدخال بعض النوادر أو الكلمات العشوائية إلى النص. إن كنت تريد أن تستخدم نص لوريم إيبسوم ما، عليك أن تتحقق أولاً أن ليس هناك أي كلمات أو عبارات محرجة أو غير لائقة مخبأة في هذا النص',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: const Color(0xFF4E5556) /* Grayscale-500 */,
                      fontSize: 13,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w600,
                      height: 1.70,
                    ),
                  ),
                ]
              ),
            ),
                ),
        ),
      ),
        );
  }
}
