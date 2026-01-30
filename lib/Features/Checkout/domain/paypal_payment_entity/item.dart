import 'package:fruits_hub/Core/entities/product_entity.dart';
import 'package:fruits_hub/Features/Home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/Features/Home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/Shared/get_currency.dart';

class Item {
  final String name;
  final int quantity;
  final String price;
  final String currency;
  Item({
    required this.name,
    required this.quantity,
    required this.price,
    required this.currency,
  });

  factory Item.fromEntity(CartItemEntity entity) {
    return Item(name: entity.productEntity.productName, quantity: entity.quantity, price: entity.productEntity.price.toString(), currency: getCurrency());
  }


  Map<String, dynamic> toJson() => {
    "name": name,
    "quantity": quantity,
    "price": price,
    "currency": currency,
  };


}
