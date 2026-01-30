import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub/Features/Checkout/domain/order_entity.dart';

class Details {
  final String? subtotal;
  final String? shipping;
  final int? shippingDiscount;

  Details({
     this.subtotal,
     this.shipping,
     this.shippingDiscount,
  });

  Map<String, dynamic> toJson() => {
    "subtotal": subtotal,
    "shipping": shipping,
    "shipping_discount": shippingDiscount,
  };

  // factory Details.fromJson(Map<String, dynamic> json) {
  //   return Details(
  //     subtotal: json["subtotal"] as String?,
  //     shipping: json["shipping"] as String?,
  //     shippingDiscount: json["shipping_discount"] as int?,
  //   );
  // }

  factory Details.fromEntity(OrderEntity entity) {
    return Details(
      subtotal: entity.cartEntity.calculateTotalPrice().toString(),
      shipping: entity.calculateShippingCost().toString(),
      shippingDiscount: entity.calculateShippingDicount().toInt(),
    );
  }
}
