import 'package:fruits_hub/Features/Checkout/domain/shipping_address_entity.dart';

class ShippingAddressModel{

  ShippingAddressModel({  this.name ,  this.email ,
    this.city ,  this.address ,  this.phone ,  this.floor});

  String? name ;
  String? email ;
  String? city ;
  String? address ;
  String? phone ;
  String? floor ;


  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity){
  return ShippingAddressModel(
      name : entity.name,
      email : entity.email,
      city :entity.city,
      address:entity.address,

  phone :entity.phone,

   floor : entity.floor,

  );
  }

  toJson(){
   return {
     "name": name,
     "email": email,
     "city": city,
     "address": address,

     "phone": phone,

     "floor": floor,

   };
  }


}