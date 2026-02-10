import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/entities/product_entity.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/fruit_item.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/get_dummy_product.dart';

class BestSellingFullGridView extends StatelessWidget {
   BestSellingFullGridView({required this .products});
  List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(

      scrollDirection:Axis.vertical,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return FruitItem(productEntity: products[index]);
            // FruitItem(productEntity: ,\);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.77,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h

      ),

      ),
    );
  }



}
