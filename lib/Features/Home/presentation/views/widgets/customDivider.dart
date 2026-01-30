import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Customdivider extends StatelessWidget {
  const Customdivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      // indent: 3.w,
      color: const Color(0xFFF1F1F5),
      height: 18.h ,
    );
  }
}
