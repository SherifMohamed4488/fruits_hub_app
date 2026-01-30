import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../Core/constants/textStyles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(16.sp),
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
          shadows: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 9,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),

        child: TextField(


          keyboardType: TextInputType.text,
          decoration: InputDecoration(

              prefixIcon: SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: Center(child: SvgPicture.asset("assets/images/search_icon.svg"))),
              suffixIcon: SizedBox(
                  width: 20.w,

                  child: Center(child: SvgPicture.asset("assets/images/filter_icon.svg"))),
              hintText: 'ابحث عن.......',

              hintStyle: TextStyles.bold13.copyWith(  color: const Color(0xFF949D9E) , height: 1.60),
              filled: true,
              fillColor: Colors.white,

              enabledBorder: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(4.r),
                  borderSide: BorderSide(
                      width: 1,
                      color:  Colors.white
                  )
              ),
              focusedBorder: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(4.r),
                  borderSide: BorderSide(
                      width: 1,
                      color:  Colors.white
                  )
              )
          ),
        ),
      ),
    );

  }
}
