import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/Core/entities/product_entity.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_cubits/cart_cubit.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_cubits/cart_states.dart';
import 'package:fruits_hub/Features/ProductsView/presentation/views/product_details_view_widget/product_details_view_body.dart';

import '../../../../Core/cubits/products_cubit.dart';
import '../../../../Core/repos/product_repo.dart';
import '../../../../Core/services/get_it_service.dart';
import '../../../Home/presentation/view_model/cubits/cart_minus_add_cubit/cart_minus_add_cubit.dart';

class ProductDetailsView extends StatelessWidget {
   ProductDetailsView({required this.productEntity});

  static const routeName = "products_details_view";
ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  ProductDetailsViewBody(productEntity: productEntity,) ,
    );
  }
}
