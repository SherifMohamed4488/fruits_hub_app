import 'dart:io';

import 'package:fruits_hub/Core/models/review_model.dart';
import 'package:fruits_hub/Shared/get_avg_rating.dart';

import '../entities/product_entity.dart';


class ProductModel{



  ProductModel({required this.productName , required this.promoCode , required this.price , required this.desc ,
      required this.isFeatured , this.imageUrl ,
    required this.expirartionMounths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.isOrganic ,
    required this.reviews ,
    required this.avgRating,
    required this.sellingCount ,
  });

  String productName, promoCode ,desc ;
  String ? imageUrl;
  int price;
  bool isFeatured;
  int expirartionMounths;
  int numberOfCalories;
  int unitAmount;
  bool isOrganic ;
  int sellingCount;
  num avgRating ;
  num ratingCount = 0;
  final List<ReviewModel> reviews;

  factory ProductModel.fromJson(Map<String , dynamic> json) {
    // Safely map reviews from List<dynamic> to List<ReviewModel>
    final reviewsList = (json["reviews"] as List<dynamic>?)
        ?.map((e) => ReviewModel.fromJson(e))
        .toList() ??
        []; // default to empty list if null
    final avgRating = getAvgRating(
        reviewsList.map((e) => e.toEntity()).toList());
    return ProductModel(
      avgRating: avgRating,
      productName: json["name"] ?? '',
      promoCode: json["code"] ?? '',
      price: json["price"] ?? 0,
      desc: json["desc"] ?? '',
      isFeatured: json["isFeatured"] ?? false,
      imageUrl: json["imageUrl"],
      expirartionMounths: json["expirartionMounths"] ?? 0,
      numberOfCalories: json["numberOfCalories"] ?? 0,
      unitAmount: json["unitAmount"] ?? 0,
      isOrganic: json["isOrganic"] ?? false,
      reviews: reviewsList, // ✅ properly typed
      sellingCount: json["sellingCount"] ?? 0,
    );
  }



  ProductEntity toEntity(){

    return ProductEntity(
      imageUrl: imageUrl,
      productName: productName,
        promoCode: promoCode,
        price: price,
        desc: desc,
        isFeatured: isFeatured,
        expirartionMounths: expirartionMounths,
        numberOfCalories: numberOfCalories,
        unitAmount: unitAmount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      isOrganic: isOrganic


    );
  }
  toJson(){

    return{
      'name' : productName,
      'code' : promoCode,
      'description' : desc,
      'price' : price,
      // 'image' : image,
      'isFeatured' : isFeatured,
      'imageUrl' : imageUrl,
      'expirartionMounths' : expirartionMounths,
      'numberOfCalories' : numberOfCalories,
      'unitAmount' : unitAmount,
      "isOrganic" : isOrganic,
      "reviews" : reviews,

    };
  }

}