import 'package:fruits_hub/Features/Checkout/domain/order_entity.dart';

import 'amount.dart';
import 'item_list.dart';

class PaypalPaymentEntity {
  final Amount? amount;
  final String? description;
  final ItemList? itemList;

  PaypalPaymentEntity({
     this.amount,
     this.description,
     this.itemList,
  });



  factory PaypalPaymentEntity.fromEntity(OrderEntity entity) {
    return PaypalPaymentEntity(
      amount: Amount.fromEntity(entity),
      description: "Payment decription",
      itemList: ItemList.fromEntity( items: entity.cartEntity.cartItems,),
    );
  }

  Map<String, dynamic> toJson() => {
    "amount": amount?.toJson(),
    "description": description,
    "item_list": itemList?.toJson(),
  };
}
