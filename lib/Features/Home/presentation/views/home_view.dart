
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Core/cubits/products_cubit.dart';
import 'package:fruits_hub/Core/repos/product_repo.dart';
import 'package:fruits_hub/Core/services/get_it_service.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/home_root_view.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});


  static const routeName = "home";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (contex) => ProductsCubit(getIt.get<ProductRepo>()),
        child: HomeRootView());
  }
}
