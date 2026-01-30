import 'package:equatable/equatable.dart';
import 'package:fruits_hub/Core/entities/product_entity.dart';

class CartItemEntity extends Equatable  {
  CartItemEntity({required this.productEntity ,  this.quantity = 0});

  final ProductEntity productEntity;
  int quantity ;
  num calculateTotalPrice(){

    return quantity * productEntity.price;
  }

  num calculateTotalWeight(){

    return quantity * productEntity.unitAmount;
  }

  increaseCount(){
    quantity ++ ;
  }
  decreaseQuantity(){
    quantity -- ;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}