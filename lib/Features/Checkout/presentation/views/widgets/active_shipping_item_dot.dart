import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActiveShippingItemDot extends StatelessWidget {
  const ActiveShippingItemDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18.w,
      height: 18.h,
      decoration: ShapeDecoration(
        color: const Color(0xFF1B5E37) /* Green1-500 */,
        shape: OvalBorder(
          side: BorderSide(width: 4, color: Colors.white),
        ),
      ),
    );
  }
}
