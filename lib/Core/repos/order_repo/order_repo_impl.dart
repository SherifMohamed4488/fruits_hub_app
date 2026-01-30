import 'package:dartz/dartz.dart';
import 'package:fruits_hub/Core/repos/order_repo/order_repo.dart';
import 'package:fruits_hub/Core/services/database_service.dart';
import 'package:fruits_hub/Core/services/firestore_service.dart';
import 'package:fruits_hub/Core/utils/backensd_endpoints.dart';
import 'package:fruits_hub/Features/Checkout/data/models/order_model.dart';
import 'package:fruits_hub/Features/Checkout/domain/order_entity.dart';

import '../../errors/failures.dart';

class OrderRepoImpl implements OrderRepo{
  OrderRepoImpl( this.databaseService);
  final DatabaseService databaseService ;
  Future<Either<Failure , void >> addOrder({required OrderEntity order })async{

    try {
      
      var orderModel = OrderModel.fromEntity(order);
      await databaseService.addData( documentId: orderModel.orderId, path: BackendEndpoints.addOrders, data: orderModel.toJson());
      return right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }

  }

}