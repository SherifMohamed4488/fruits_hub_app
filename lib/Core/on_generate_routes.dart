import 'package:flutter/material.dart';
import 'package:fruits_hub/Core/entities/product_entity.dart';
import 'package:fruits_hub/Features/BestSelling/presentation/views/best_selling_view.dart';
import 'package:fruits_hub/Features/Home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/Features/Home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/Features/Home/presentation/views/cart_view.dart';
import 'package:fruits_hub/Features/ProductsView/presentation/views/product_details_view_widget/product_details_view_body.dart';
import 'package:fruits_hub/Features/Profile/presentation/views/favourite_view.dart';
import 'package:fruits_hub/Features/Profile/presentation/views/personal_file_view.dart';
import 'package:fruits_hub/Features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/Features/auth/presentation/views/sign_up_view.dart';
import 'package:fruits_hub/Features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruits_hub/Features/splash/presentation/views/splash_view.dart';

import '../Features/Checkout/presentation/views/checkout_view.dart';
import '../Features/Home/presentation/views/home_view.dart';
import '../Features/ProductsView/presentation/views/product_details_view.dart';
import '../Features/ProductsView/presentation/views/products_view.dart';
import '../Features/Profile/presentation/views/who_are_we_view.dart';
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
    case PersonalFileView.routeName:
      return MaterialPageRoute(builder: (context) =>  PersonalFileView());
    case WhoAreWeView.routeName:
      return MaterialPageRoute(builder: (context) =>  WhoAreWeView());
    case FavouriteView.routeName:
      return MaterialPageRoute(builder: (context) =>  FavouriteView());
    case ProductDetailsView.routeName:
      return MaterialPageRoute(builder: (context) =>  ProductDetailsView(productEntity: settings.arguments as ProductEntity,));
    default :
      return MaterialPageRoute(builder: (context) => const Scaffold());

  }
}