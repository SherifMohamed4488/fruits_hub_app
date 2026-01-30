import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/constants/app_colors.dart';
import 'package:fruits_hub/Core/constants/constant.dart';
import 'package:fruits_hub/Core/services/prefs.dart';
import 'package:fruits_hub/Features/auth/presentation/views/login_view.dart';
import 'package:fruits_hub/Features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/Features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:fruits_hub/Shared/custom_button.dart';
import 'package:gap/gap.dart';

class OnBoardingViewBody extends StatefulWidget {
  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  var currentPage = 0;
  late PageController pageController;

  @override
  void initState() {

    // TODO: implement initState
    super.initState();

    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});

    });



  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: OnBoardingPageView(pageController: pageController)),
          DotsIndicator(
            dotsCount: 2,
            decorator: DotsDecorator(
              activeColor: AppColors.PrimaryColor,
              color:  currentPage == 1 ? AppColors.PrimaryColor : AppColors.PrimaryColor.withAlpha(127),
            ),
          ),

          Gap(20.h),


          Visibility(
            visible: currentPage == 1 ? true : false,
            maintainSize: true,//////////////////////
            maintainAnimation: true,/////////////////
            maintainState: true, //////////////////////////
            child:
            CustomButton(

                onPressed: () {
              Navigator.of(context).pushReplacementNamed(LoginView.routeName);

            }, text: 'ابدأ الان'),
          ),
          Gap(20.h),
        ],
      ),
    );
  }
}
