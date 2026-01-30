import '../../../Home/domain/entities/cart_item_entity.dart';

class OrderProductModel{


  String productName ;
  String promoCode;
  String? imageUrl;
  int price;
  int quantity ;
  OrderProductModel(
      {required this.productName, required this.promoCode, required this.imageUrl ,
        required this.price , required this.quantity});

  factory OrderProductModel.fromEntity({required CartItemEntity cartItemEntity}){

    return OrderProductModel(productName: cartItemEntity.productEntity.productName,
        promoCode:  cartItemEntity.productEntity.promoCode,
        imageUrl:  cartItemEntity.productEntity.imageUrl,
        price:  cartItemEntity.productEntity.price,
        quantity: cartItemEntity.quantity

    );
  }

  toJson(){

    return {

      "productName" : productName,
      "promoCode" : promoCode,
      "imageUrl" : imageUrl,
      "price" : price,
      "quantity" : quantity,


    };
  }
}