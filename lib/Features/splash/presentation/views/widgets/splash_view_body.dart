import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/Core/services/firebase_auth_service.dart';
import 'package:fruits_hub/Features/Home/presentation/views/home_view.dart';
import 'package:fruits_hub/Features/auth/presentation/views/login_view.dart';
import 'package:fruits_hub/Features/on_boarding/presentation/views/on_boarding_view.dart';

import '../../../../../Core/constants/constant.dart';
import '../../../../../Core/services/prefs.dart';
import '../../../../../gen/assets.gen.dart';


class SplashViewBody extends StatefulWidget {

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {


    super.initState();
    executeNavigation();

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              Assets.images.freepikPlantInject63.path,
            ),
          ],
        ),


        SvgPicture.asset(
          Assets.images.fruitHubLogo.path,
        ),

        SvgPicture.asset(
          Assets.images.dotsLogo.path,
          fit: BoxFit.fill,
        )

      ],
    );

  }
  void executeNavigation(){

    bool isOnBoardingViewBody = Prefs.getBool(kIsBoardingViewSeen);



    if(isOnBoardingViewBody){

      Future.delayed(Duration(seconds: 3) , (){

        var isLoggedIN = FirebaseAuthService().isLoggedIn();
        if(isLoggedIN){

          Navigator.pushReplacementNamed(context, HomeView.routeName);

        } else{
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        }
      });
    }else{
      Future.delayed(Duration(seconds: 3) , (){

        Navigator.pushReplacementNamed(context, OnBoardingView.routName);
      });
    }

  }
}

