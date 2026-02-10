import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fruits_hub/Core/entities/review_entity.dart';


class ProductEntity extends Equatable{



  ProductEntity({required this.productName , required this.promoCode , required this.price , required this.desc ,
     required this.isFeatured , this.imageUrl ,  required this.expirartionMounths,

    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,


  });

  String productName, promoCode ,desc ;
  String ? imageUrl;
  int price ;

  bool isFeatured;
  int expirartionMounths;
  bool isOrganic ;
  final List<ReviewEntity> reviews;
  int numberOfCalories;
  int unitAmount;
  num avgRating  = 0;
  num ratingCount = 0;

  @override
  // TODO: implement props
  List<Object?> get props => [promoCode];



}
