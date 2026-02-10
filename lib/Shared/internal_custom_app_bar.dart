import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';
import 'package:gap/gap.dart';

class InternalCustomAppBar extends StatelessWidget {
   InternalCustomAppBar({required this.text , required this.arrowVisible ,  this.showNotification = true});

  String text;
  bool arrowVisible ;
      bool showNotification ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Visibility(
          visible: arrowVisible,
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              width: 44.w,
              height: 44.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(
                  side: BorderSide(
                    width: 1,
                    color: const Color(0xFFF1F1F5),
                  ),
                ),
              ),
              child: Center(child: SvgPicture.asset("assets/images/arrow_back_icon.svg" , height: 22.h , width: 22.w,)),
            ),
          ),
        ),
        
        Visibility(child: Gap(arrowVisible ? 66.w : 132.w )),
        // Spacer(),

        Text(
          text,
          // textAlign: TextAlign.center,
          style: TextStyles.bold19.copyWith(color: const Color(0xFF0C0D0D))
        ),

        Gap(showNotification ? 107.w : 0.w ),


        Visibility(
          visible: showNotification,
          child: Container(
            width: 35.w,
            height: 35.h,
            decoration: ShapeDecoration(
              color: const Color(0xFFEEF8ED) /* green-50 */,
              shape: OvalBorder(),
            ),

            child: Center(child: SvgPicture.asset("assets/images/bell_logo.svg")),
          ),
        ),


      ],
    );
  }
}
