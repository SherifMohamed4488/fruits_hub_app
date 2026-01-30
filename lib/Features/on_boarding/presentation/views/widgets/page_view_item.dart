import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/Core/constants/constant.dart';
import 'package:fruits_hub/Core/services/prefs.dart';

import '../../../../auth/presentation/views/login_view.dart';

class PageViewItem extends StatelessWidget {
  PageViewItem({
    required this.image,
    required this.backgroundImage,
    required this.titleAndSubtitle,
    required this.isVisible,
  });

  String image, backgroundImage, titleAndSubtitle;
  bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 25,
                left: 0,
                right: 0,
                child: SvgPicture.asset(image),
              ),

              Visibility(
                visible: isVisible,
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: GestureDetector(
                    onTap: () {

                      Prefs.setBool(kIsBoardingViewSeen, true);
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(LoginView.routeName);
                    },
                    child: Text("تخط", style: TextStyle(color: Colors.black)),
                  ),
                ),
              ),

              Positioned(
                right: 0,
                left: 0,
                top: 450.h,

                child: SvgPicture.asset(titleAndSubtitle, height: 150.h),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
