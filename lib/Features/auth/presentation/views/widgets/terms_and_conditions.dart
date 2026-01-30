import 'package:flutter/material.dart' ;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/constants/app_colors.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/terms_and_conditions_text.dart';


class TermsAndConditions extends StatefulWidget {
   TermsAndConditions({required this.valueChanged});
 ValueChanged<bool> valueChanged;
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {

  // bool isChecked =true ;
  bool isTermsAccepted = false ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 14.h),
      child: Row(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          // SizedBox(width: 20.w,),
          GestureDetector(
            onTap: (){
              setState(() {
                isTermsAccepted = !isTermsAccepted;
                widget.valueChanged(isTermsAccepted);

              });

            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 50),
              width: 24.w,
              height: 24.h,
              child: isTermsAccepted ?  Center(child: Icon(Icons.check , color: Colors.white,  size: 16.sp,)) : null ,
              decoration: ShapeDecoration(
                  color: isTermsAccepted ? AppColors.PrimaryColor : Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1.5.w,
                      color: isTermsAccepted ? AppColors.PrimaryColor : const Color(0xFFDCDEDE)                   ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),

          // SizedBox(width: 1,),
          Padding(
            padding:  EdgeInsets.only( right: 16.w),
            child: TermsAndConditionsText(),
          ),
        ],
      ),
    );
  }
}