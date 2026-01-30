
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Core/cubits/products_states.dart';
import 'package:fruits_hub/Core/repos/product_repo.dart';
import 'package:fruits_hub/Features/auth/domain/repos/auth_repo.dart';


class ProductsCubit extends Cubit<ProductsStates>{

  ProductsCubit(this.productRepo) : super(ProductsInitial());

  final ProductRepo productRepo ;
  int productsLength = 0 ;

  Future<void> getProducts() async{
    emit(ProductsLoading());

    var products = await productRepo.getProducts();
    products.fold(

      (failure) => emit(ProductsFailure(message: failure.message)),
            (products) {

          productsLength += products.length;
          emit(ProductsSuccess(products: products));
        }
    );
  }

  Future<void> getBestSellingProducts() async{
    emit(ProductsLoading());

    var products = await productRepo.getBestSellingProduct();
    products.fold(

            (failure) => emit(ProductsFailure(message: failure.message)),
            (products) {
              productsLength += products.length;
              emit(ProductsSuccess(products: products));
            }
            );
  }

}