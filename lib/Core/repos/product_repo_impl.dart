import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruits_hub/Core/models/product_model.dart';
import 'package:fruits_hub/Core/repos/product_repo.dart';
import 'package:fruits_hub/Core/services/database_service.dart';
import 'package:fruits_hub/Core/utils/backensd_endpoints.dart';

import '../entities/product_entity.dart';
import '../errors/failures.dart';

class ProductRepoImpl extends ProductRepo{
  ProductRepoImpl({required this.databaseService});

  final DatabaseService databaseService ;

  @override
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(path: BackendEndpoints.getProducts);

      print("🟢 Raw Firestore data: $data"); // 🔹 ADD THIS

      if (data is! List) {
        return left(ServerFailure(message: "Invalid data format: expected List"));
      }

      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();

      return right(products);
    } catch (e, stack) {
      print("❌ getProducts failed: $e");
      print(stack);
      return left(ServerFailure(message: e.toString()));
    }
  }



  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProduct()async {
    // TODO: implement getBestSellingProduct
    try {
      var data = await databaseService.getData(path: BackendEndpoints.getProducts , query: {"limit" : 10 , "orderBy" : "sellingCount" , "descending" : true});

      if (data is!List) {
        return left(ServerFailure(message: "Invalid data format"));
      }
      print("🟢 Raw Firestore data: $data"); // 🔹 ADD THIS

      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();

      return right(products);

    } catch (e) {

      return left(ServerFailure(message: "failed to get products"));
    }
  }

}