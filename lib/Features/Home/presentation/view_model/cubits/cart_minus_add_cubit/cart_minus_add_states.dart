import '../../../../domain/entities/cart_item_entity.dart';

class CartMinusAddStates{}

class CartMinusAddSInitial extends CartMinusAddStates{}

class CartMiCartMinusAddUpdtaed extends CartMinusAddStates{
  final CartItemEntity cartItemEntity ;
  CartMiCartMinusAddUpdtaed(this.cartItemEntity);
}
