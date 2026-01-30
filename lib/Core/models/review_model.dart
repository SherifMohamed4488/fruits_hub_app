
import '../entities/review_entity.dart';

class ReviewModel{

  ReviewModel({required this.name ,required this.image ,required this.rating ,required this.date ,
  required this.reviewDesc ,
});
String name ;
String image  ;
num rating ;
String date ;
String reviewDesc;


  factory ReviewModel.fromEntity(ReviewEntity reviewEntity){

    return ReviewModel(
        name: reviewEntity.name,
        image: reviewEntity.image,
        rating: reviewEntity.rating,
        date: reviewEntity.date,
        reviewDesc: reviewEntity.reviewDesc
    );
  }
  factory ReviewModel.fromJson(Map<String, dynamic > json){

    return ReviewModel(name: json["name"],
        image: json["image"],
        rating: json["rating"],
        date: json["date"],
        reviewDesc: json["reviewDescription"]
    );
  }

  ReviewEntity toEntity(){

    return ReviewEntity(name: name, image: image, rating: rating, date: date, reviewDesc: reviewDesc);
  }
  

  toJson(){

    return{
      'name' : name,
      'image' :  image,
      'rating' : rating,
      'date' : date,
      'reviewDesc' : reviewDesc,


    };
  }


}