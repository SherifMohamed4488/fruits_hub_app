import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/entities/product_entity.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/fruit_item.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/get_dummy_product.dart';

class BestSellingGridView extends StatelessWidget {
   BestSellingGridView({required this.products});

  List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),

        sliver: SliverGrid(

          delegate: SliverChildBuilderDelegate(

              childCount: products.length,
                  (context, index) {
                return FruitItem(productEntity: products[index]);
              }),

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2,
              childAspectRatio: 0.77,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h
          ),

        )
    );
  }



}
