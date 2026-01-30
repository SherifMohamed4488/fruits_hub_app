import 'package:fruits_hub/Features/Checkout/data/models/shipping_address_model.dart';
import 'package:fruits_hub/Features/Checkout/domain/order_entity.dart';
import 'package:uuid/uuid.dart';

import '../../../../Core/models/product_model.dart';
import 'order_product_model.dart';

class OrderModel {
  final double totalPrice;
  final String uID;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProductsModel;
  final String paymentMethod;
 final String orderId;
  OrderModel({
    required this.totalPrice,
    required this.uID,
    required this.orderProductsModel,
    required this.paymentMethod,
    required this.shippingAddressModel,
    required this.orderId
  });

  factory OrderModel.fromEntity(OrderEntity orderEntity){
    
    return OrderModel(
        orderId: Uuid().v4(),
        totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
        uID: orderEntity.uID,
        shippingAddressModel: ShippingAddressModel.fromEntity(orderEntity.shippingAddressEntity),
        orderProductsModel: orderEntity.cartEntity.cartItems.map((e) => OrderProductModel.fromEntity(cartItemEntity: e)).toList(),
        paymentMethod: orderEntity.payWithCash! ? "Cash" : "Online"
    );

  }

  Map<String, dynamic> toJson() {
    return {
      "orderId" : orderId,
      "totalPrice": totalPrice,
      "uId": uID,
      "status": "pending",
      "date" : DateTime.now().toString(),
      "shippingAddress": shippingAddressModel?.toJson(),
      "orderProducts":
      orderProductsModel.map((e) => e.toJson()).toList(),
      "paymentMethod": paymentMethod,
    };
  }
}


