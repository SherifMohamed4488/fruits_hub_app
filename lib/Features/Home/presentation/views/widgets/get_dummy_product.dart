import 'dart:io';

import '../../../../../Core/entities/product_entity.dart';

ProductEntity getDummyOneProduct() {
  return ProductEntity(
    productName: 'Fresh Apple',
    promoCode: 'APPLE20',
    price: 25,
    desc: 'Fresh organic apples rich in vitamins and fiber.',
    // dummy file path
    isFeatured: true,
    expirartionMounths: 2,
    isOrganic: true,
    numberOfCalories: 95,
    unitAmount: 1,
    // grams
    reviews: [],
  );
}

List<ProductEntity> getDummyAllProducts(){

  return [


    getDummyOneProduct(),
    getDummyOneProduct(),
    getDummyOneProduct(),
    getDummyOneProduct(),
    getDummyOneProduct(),
    getDummyOneProduct(),
    getDummyOneProduct(),
    getDummyOneProduct(),

  ];
}