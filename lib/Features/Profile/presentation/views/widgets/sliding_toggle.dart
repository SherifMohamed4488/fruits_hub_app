import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlidingToggle extends StatefulWidget {
  @override
  _SlidingToggleState createState() => _SlidingToggleState();
}

class _SlidingToggleState extends State<SlidingToggle> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOn = !isOn;
        });
      },
      child: Container(
        width: 50.w,
        height: 24.h,
        decoration:
        ShapeDecoration(
           color: isOn ? Colors.green :  Color(0x7F888FA0),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: const Color(0x7F888FA0)),
            borderRadius: BorderRadius.circular(36.50.r),
          ),
        ),
        // BoxDecoration(
        //   color: isOn ? Colors.green :  Color(0x7F888FA0),
        //
        //   borderRadius: BorderRadius.circular(36.r),
        // ),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: Duration(milliseconds: 50),
              curve: Curves.easeInOut,
              alignment: isOn ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
                width: 22.w,
                height: 22.h,
                margin: EdgeInsets.all(0.sp),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: const Color(0x7F888FA0)),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x07000000),
                      blurRadius: 1,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    ),BoxShadow(
                      color: Color(0x02000000),
                      blurRadius: 1,
                      offset: Offset(0, 1),
                      spreadRadius: 0,
                    ),BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
