import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/constants/textStyles.dart';

class PersonalTextField extends StatelessWidget {
  PersonalTextField({ this.hintText , required this.textInputType , required this.controller,
    this.suffixIcon , this.onSaved , this.isObsecure=false , this.enabled});

  String? hintText;
  TextInputType textInputType;
  Widget? suffixIcon ;
  void Function(String?)? onSaved;
  bool isObsecure;
  TextEditingController controller;

bool? enabled;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      enabled: enabled,
      controller: controller,
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
