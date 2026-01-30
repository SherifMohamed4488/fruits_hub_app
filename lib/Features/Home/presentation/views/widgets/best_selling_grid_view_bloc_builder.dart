import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Core/cubits/products_cubit.dart';
import 'package:fruits_hub/Core/cubits/products_states.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/custom_error_widget.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/get_dummy_product.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'best_selling_grid_view.dart';
class BestSellingGridViewBlocBuilder extends StatelessWidget {
  const BestSellingGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit , ProductsStates>(

        builder: (context , state){

          if(state is ProductsSuccess){

            return BestSellingGridView(products: state.products,);
          }else if (state is ProductsFailure){

            return SliverToBoxAdapter(child: CustomErrorWidget(text: state.message));
          }else{
            return Skeletonizer.sliver(
                enabled: true,
                child : BestSellingGridView(products: getDummyAllProducts(),)
            );
          }
        }

    );
  }
}


