import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/cart_item.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/customDivider.dart';

import '../../../domain/entities/cart_item_entity.dart';

class CartItemListView extends StatelessWidget {
   CartItemListView({required this.cartItems});

  List <CartItemEntity> cartItems ;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(


        // padding: EdgeInsets.zero,
        // physics: BouncingScrollPhysics(),
        itemCount: cartItems.length,
        itemBuilder: (context , index){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: CartItem(cartItemEntity: cartItems[index],),
    );

        },
      separatorBuilder: (context , index) =>

          Customdivider()



    );
  }
}
