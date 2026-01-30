

import 'package:fruits_hub/Features/Checkout/domain/shipping_address_entity.dart';
import 'package:fruits_hub/Features/Home/domain/entities/cart_entity.dart';

import '../../Home/domain/entities/cart_item_entity.dart';

class OrderEntity {
  final String uID;
   final CartEntity cartEntity;
    bool? payWithCash;
    ShippingAddressEntity shippingAddressEntity = ShippingAddressEntity();

  OrderEntity({
    required this.cartEntity,
     this.payWithCash,
    required this.uID,

  });


  double calculateShippingCost(){

    if(payWithCash!){
      return 40;
    }else{
      return 0;
    }
  }

  double calculateShippingDicount(){

    return 0;
  }

  double calculateTotalPriceAfterdicountAndShipping(){

    return cartEntity.calculateTotalPrice() + calculateShippingCost() - calculateShippingDicount();
  }


}
