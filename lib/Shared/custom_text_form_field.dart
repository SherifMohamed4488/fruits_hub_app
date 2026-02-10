import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Core/constants/textStyles.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({required this.hintText , required this.textInputType ,
     this.suffixIcon , this.onSaved , this.isObsecure=false  , });

  String hintText;
  TextInputType textInputType;
  Widget? suffixIcon ;
  void Function(String?)? onSaved;
   bool isObsecure;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      style: TextStyles.regular14,
      obscureText: isObsecure,
      onSaved: onSaved,
      validator: (value){
        if(value == null || value.isEmpty)  {
          return "هذا الحقل مطلوب";
        }
        return null;
      },
      keyboardType: textInputType,
      decoration: InputDecoration(

        suffixIcon: suffixIcon,
        hintText: hintText ,
        hintStyle: TextStyles.bold13.copyWith(  color: const Color(0xFF949D9E)),
        filled: true,
        fillColor: const Color(0xFFF9FAFA),

        enabledBorder: OutlineInputBorder(

          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 1,
            color:  const Color(0xFFE6E9E9)
          )
        ),
        focusedBorder: OutlineInputBorder(

      borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(
            width: 1,
            color:  const Color(0xFFE6E9E9)
        )
    )
      ),
    );
  }
}
