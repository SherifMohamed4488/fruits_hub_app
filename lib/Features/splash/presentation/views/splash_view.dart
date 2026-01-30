
import 'package:flutter/material.dart';
import 'package:fruits_hub/Features/splash/presentation/views/widgets/splash_view_body.dart';


import '../../../../gen/assets.gen.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  static const routeName = "splash";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SplashViewBody())
    );
  }
}
