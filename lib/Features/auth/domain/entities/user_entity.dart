class UserEntity {

  UserEntity({required this.name , required this.email , required this.uId});
  String name , email , uId;

  toMap(){

   return {
     "name": name,
     "email": email,
     "uId" : uId
   };

  }

}