import 'package:dartz/dartz.dart';
import 'package:fruits_hub/Core/entities/product_entity.dart';

import '../errors/failures.dart';

abstract class ProductRepo {

  Future<Either<Failure , List<ProductEntity>>> getProducts();
  Future<Either<Failure , List<ProductEntity>>> getBestSellingProduct();

}