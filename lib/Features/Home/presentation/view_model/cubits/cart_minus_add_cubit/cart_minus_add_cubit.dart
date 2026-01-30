import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Features/Home/domain/entities/cart_item_entity.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_minus_add_cubit/cart_minus_add_states.dart';


class CartMinusAddCubit extends Cubit<CartMinusAddStates> {
  CartMinusAddCubit() : super(CartMinusAddStates());
  // list of cart
void updateCartItem(CartItemEntity cartItemEntity){
  emit(CartMiCartMinusAddUpdtaed(cartItemEntity));
}

}
