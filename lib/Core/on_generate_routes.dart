import 'package:flutter/material.dart';
import 'package:fruits_hub/Features/BestSelling/presentation/views/best_selling_view.dart';
import 'package:fruits_hub/Features/Home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/Features/Home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/Features/Home/presentation/views/cart_view.dart';
import 'package:fruits_hub/Features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/Features/auth/presentation/views/sign_up_view.dart';
import 'package:fruits_hub/Features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/Features/splash/presentation/views/splash_view.dart';

import '../Features/Checkout/presentation/views/checkout_view.dart';
import '../Features/Home/presentation/views/home_view.dart';
import '../Features/ProductsView/presentation/views/products_view.dart';
import '../Features/auth/presentation/views/login_view.dart';

Route<dynamic> onGenerateRoute (RouteSettings settings){

  switch (settings.name){

    case SplashView.routeName :
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnBoardingView.routName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());

    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());

    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());
    case ProductsView.routeName:
      return MaterialPageRoute(builder: (context) => const ProductsView());
    case CartView.routeName:
      return MaterialPageRoute(builder: (context) =>  CartView());
    case CheckoutView.routeName:
      return MaterialPageRoute(builder: (context) =>  CheckoutView(cartEntity: settings.arguments as CartEntity, ));
    default :
      return MaterialPageRoute(builder: (context) => const Scaffold());

  }
}