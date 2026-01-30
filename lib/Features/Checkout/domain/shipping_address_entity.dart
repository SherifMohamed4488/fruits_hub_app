class ShippingAddressEntity{
ShippingAddressEntity({  this.name ,  this.email ,
   this.city ,  this.address ,  this.phone ,  this.floor});
  String? name ;
  String? email ;
  String? city ;
  String? address ;
String? phone ;
String? floor ;

String toString(){

  return "$address $floor $city";
}


}