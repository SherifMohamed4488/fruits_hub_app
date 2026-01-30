
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InActiveShippingItemDot extends StatelessWidget {
  const InActiveShippingItemDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18.w,
      height: 18.h,
      decoration: ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(
            width: 1,
            color: const Color(0xFF949D9E) /* Grayscale-400 */,
          ),
        ),
      ),
    );
  }
}
