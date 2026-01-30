import 'package:fruits_hub/Core/entities/product_entity.dart';
import 'package:fruits_hub/Features/auth/domain/entities/user_entity.dart';

class ProductsStates{}

class ProductsInitial extends ProductsStates{}
class ProductsLoading extends ProductsStates{}
class ProductsSuccess extends ProductsStates{

  final List<ProductEntity> products ;

  ProductsSuccess({required this.products});
}
class ProductsFailure extends ProductsStates{

  final String message ;

  ProductsFailure({required this.message});

}
