import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Core/cubits/products_cubit.dart';
import 'package:fruits_hub/Features/ProductsView/presentation/views/widgets/products_view_body.dart';

import '../../../../Core/repos/product_repo.dart';
import '../../../../Core/services/get_it_service.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});
  static const routeName = "products_view";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductRepo>()),
      child: Scaffold(
          
          body: SafeArea(child: ProductsViewBody())),
    );
  }
}
