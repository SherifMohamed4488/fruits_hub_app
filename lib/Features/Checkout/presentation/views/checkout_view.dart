import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Core/repos/order_repo/order_repo.dart';
import 'package:fruits_hub/Features/Checkout/domain/order_entity.dart';
import 'package:fruits_hub/Features/Checkout/presentation/view_model/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruits_hub/Features/Home/domain/entities/cart_entity.dart';
import 'package:fruits_hub/Features/auth/domain/entities/user_entity.dart';
import 'package:fruits_hub/Shared/get_user.dart';
import 'package:provider/provider.dart';

import '../../../../Core/services/get_it_service.dart';
import '../../../Home/domain/entities/cart_item_entity.dart';

// class CheckoutView extends StatelessWidget {
//    CheckoutView({required this.cartEntity});
//
//   static const routeName = "checkout";
//   CartEntity cartEntity ;
//    final user =  getUser();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AddOrderCubit(getIt<OrderRepo>()),
//       child: Scaffold(body: SafeArea(
//           child: Provider.value(
//
//             value: OrderEntity(cartEntity: cartEntity , uID: getUser()!.uId),
//
//           child: AddOrderCubitBlocBuilder(widget: CheckoutViewBody())))),
//     );
//   }
// }

class CheckoutView extends StatefulWidget {
  CheckoutView({required this.cartEntity});

  static const routeName = "checkout";
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserEntity?>(
      future: getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snapshot.data;
        final uId = user?.uId ?? '';

        return BlocProvider(
          create: (context) => AddOrderCubit(getIt<OrderRepo>()),
          child: Scaffold(
            body: SafeArea(
              child: Provider.value(
                value: OrderEntity(
                  cartEntity: widget.cartEntity,
                  uID: uId,   // <-- هنا لازم String
                ),
                child: AddOrderCubitBlocBuilder(widget: CheckoutViewBody()),
              ),
            ),
          ),
        );
      },
    );
  }
}

//
// class CheckoutView extends StatelessWidget {
//   CheckoutView({
//     required this.cartEntity,
//     required this.userId,
//   });
//
//   static const routeName = "checkout";
//
//   final CartEntity cartEntity;
//   final String userId;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => AddOrderCubit(getIt<OrderRepo>()),
//       child: Scaffold(
//         body: SafeArea(
//           child: Provider.value(
//             value: OrderEntity(
//               cartEntity: cartEntity,
//               uID: userId,
//             ),
//             child: AddOrderCubitBlocBuilder(
//               widget: CheckoutViewBody(),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

