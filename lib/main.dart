import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/constants/app_colors.dart';
import 'package:fruits_hub/Core/cubits/products_cubit.dart';
import 'package:fruits_hub/Core/on_generate_routes.dart';
import 'package:fruits_hub/Core/services/get_it_service.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_cubits/cart_cubit.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/favourite_cubit/favourite_cubit.dart';
import 'package:fruits_hub/Features/ProductsView/data/photo_cubit/photo_cubit.dart';
import 'package:fruits_hub/Features/auth/domain/repos/auth_repo.dart';
import 'package:fruits_hub/Features/auth/presentation/views_model/cubits/log_in/log_in_cubit.dart';
import 'package:fruits_hub/Features/splash/presentation/views/splash_view.dart';
import 'Core/repos/product_repo.dart';
import 'Core/services/custom_bloc_observer.dart';
import 'Core/services/database_service.dart';
import 'Core/services/prefs.dart';
import 'Features/Profile/presentation/view_model/cubits/update_cubit.dart';
import 'firebase_options.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
// print("before check");
  // await FirebaseAppCheck.instance.activate(
  //   androidProvider: AndroidProvider.debug, // أو playIntegrity
  // );
  //
  // print("after check");

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
          (_, __) => MultiBlocProvider(
            providers: [
              BlocProvider<UpdateCubit>( create: (context) => UpdateCubit( getIt.get<DatabaseService>(), getIt.get<AuthRepo>(), ), ),
              BlocProvider<FavouriteCubit>( create: (context) => FavouriteCubit(), ),
              BlocProvider<CartCubit>( create: (context) => CartCubit()),
              BlocProvider<PhotoCubit>( create: (context) => PhotoCubit(getIt.get<DatabaseService>())),
    BlocProvider<LogInCubit>( create: (context) => LogInCubit(getIt.get<AuthRepo>())),
              BlocProvider<ProductsCubit>( create: (context) => ProductsCubit( getIt.get<ProductRepo>())),



            ],
            child: MaterialApp(



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
          ),

      );



  }
}
