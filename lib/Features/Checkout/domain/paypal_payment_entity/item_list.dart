import 'package:fruits_hub/Features/Home/domain/entities/cart_item_entity.dart';

import 'item.dart';

class ItemList {

  final List<Item> items;

  ItemList({required this.items});



  factory ItemList.fromEntity({required List<CartItemEntity>items}) {
    return ItemList(items: items.map((e) => Item.fromEntity(e)).toList());
  }


  Map<String, dynamic> toJson() => {
    "items": items.map((item) => item.toJson()).toList(),
  };
}
