import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Core/entities/product_entity.dart';
import 'package:fruits_hub/Features/Home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/Features/Home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/Features/auth/domain/repos/auth_repo.dart';

import 'cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitial());
  // list of cart
  CartEntity cartEntity = CartEntity(cartItems: []);

  void addProduct(ProductEntity productEntity) {

    bool isProductExist = cartEntity.isExist(product: productEntity);
    var cartItem = cartEntity.getCartItem(productEntity);

    if (isProductExist) {
      cartItem.increaseCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(CartItemAdded());
  }

 void deleteCartItem(CartItemEntity cartItemEntity){
cartEntity.removeCartItem(cartItemEntity);
emit(CartItemRemoved());

 }
}
