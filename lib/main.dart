import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/constants/app_colors.dart';
import 'package:fruits_hub/Core/on_generate_routes.dart';
import 'package:fruits_hub/Core/services/get_it_service.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/checkout_view.dart';
import 'package:fruits_hub/Features/Home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/Features/Home/presentation/views/cart_view.dart';
import 'package:fruits_hub/Features/Home/presentation/views/home_view.dart';
import 'package:fruits_hub/Features/splash/presentation/views/splash_view.dart';

import 'Core/services/custom_bloc_observer.dart';
import 'Core/services/prefs.dart';
import 'firebase_options.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();

  setUpGetIt();
  runApp(const FruitApp());
}

class FruitApp extends StatelessWidget {
  const FruitApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: Size(375, 812), // Base design size (from your Figma etc.)
      minTextAdapt: true,
      splitScreenMode: true,

      builder:
          (_, __) => MaterialApp(



            locale: const Locale('ar'),
            supportedLocales: const [
              Locale('ar'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          fontFamily: "Cairo",
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.PrimaryColor),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
            onGenerateRoute: onGenerateRoute,
            initialRoute: SplashView.routeName,
            home: SplashView(),),

      );



  }
}
