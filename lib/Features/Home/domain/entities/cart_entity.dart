import 'package:fruits_hub/Core/entities/product_entity.dart';
import 'package:fruits_hub/Features/Home/domain/entities/cart_item_entity.dart';

class CartEntity {
  CartEntity({required this.cartItems});

  List<CartItemEntity> cartItems;

  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  removeCartItem(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }

  isExist({required ProductEntity product}) {
    bool isExist = false;
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return true;
      }
    }

    return false;
  }

  double calculateTotalPrice(){
    double totalPrice = 0;
    for(var cartItem in cartItems){

      totalPrice+=cartItem.calculateTotalPrice();
    }

    return totalPrice;
  }

  getCartItem(ProductEntity product){

    for(var cartItem in cartItems){
      if(cartItem.productEntity == product){
        return cartItem;

      }
    }
    return CartItemEntity(productEntity: product , quantity: 1);

  }
}
