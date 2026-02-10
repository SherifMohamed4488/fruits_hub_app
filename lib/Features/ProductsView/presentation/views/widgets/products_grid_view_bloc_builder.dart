import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Features/ProductsView/presentation/views/widgets/products_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../Core/cubits/products_cubit.dart';
import '../../../../../Core/cubits/products_states.dart';
import '../../../../Home/presentation/views/widgets/best_selling_grid_view.dart';
import '../../../../Home/presentation/views/widgets/custom_error_widget.dart';
import '../../../../Home/presentation/views/widgets/get_dummy_product.dart';

class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit , ProductsStates>(

        builder: (context , state){

          if(state is ProductsSuccess){

            return ProductsGridView(products: state.products,);
          }else if (state is ProductsFailure){

            return SliverToBoxAdapter(child: CustomErrorWidget(text: state.message));
          }else{
            return Skeletonizer.sliver(
                enabled: true,
                child : ProductsGridView(products: getDummyAllProducts(),)
            );
          }
        }

    );
  }
}
