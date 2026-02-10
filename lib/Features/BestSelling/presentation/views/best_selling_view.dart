import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Features/BestSelling/presentation/views/widgets/best_selling_view_body.dart';

import '../../../../Core/constants/textStyles.dart';
import '../../../../Core/cubits/products_cubit.dart';
import '../../../../Core/repos/product_repo.dart';
import '../../../../Core/services/get_it_service.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});



  static const routeName = "best_selling";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   centerTitle: true,
        //   title: Text(
        //     'المفضلة',
        //     textAlign: TextAlign.center,
        //     style: TextStyles.bold19.copyWith(color: Colors.black),
        //   ),
        // ),
        backgroundColor: Colors.white,
        body: SafeArea(child:
        BestSellingViewBody()));
  }
}
