import 'package:dartz/dartz.dart';
import 'package:fruits_hub/Core/errors/failures.dart';

import '../../../Features/Checkout/domain/order_entity.dart';

abstract class OrderRepo{

  Future<Either<Failure , void >> addOrder({required OrderEntity order});

}