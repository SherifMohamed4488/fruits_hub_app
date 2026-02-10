// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_cubits/cart_cubit.dart';
// import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_cubits/cart_states.dart';
// import 'package:fruits_hub/Features/ProductsView/presentation/views/products_view.dart';
// import 'package:fruits_hub/Features/Profile/presentation/views/widgets/profile_view_body.dart';
// import 'package:fruits_hub/Shared/error_success_snack_bar.dart';
//
// import '../../../../Profile/presentation/views/profile_view.dart';
// import '../cart_view.dart';
// import 'custom_bottom_navigation_bar.dart';
// import 'home_view_body.dart';
//
// class HomeRootView extends StatefulWidget {
//   const HomeRootView({super.key});
//
//   @override
//   State<HomeRootView> createState() => _HomeRootViewState();
// }
//
// class _HomeRootViewState extends State<HomeRootView> {
//   int currentIndex = 0;
//
//   final List<Widget> pages = [
//     const HomeViewBody(),
//     const ProductsView(),
//     CartView(),
//     ProfileView(),
//
//     // SearchView(),
//     // CartView(),
//     // ProfileView(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CartCubit(),
//       child: Scaffold(
//         body: SafeArea(
//           child: BlocListener<CartCubit , CartStates>(
//             listener: (context , state){
//
//               if(state is CartItemAdded){
//
//                 errorAndSuccessSnackBar(context, "تم اضافه المنتج الى سلة التسوق بنجاح" , Colors.green);
//
//               }  if(state is CartItemRemoved){
//
//                 errorAndSuccessSnackBar(context, "تم حذف العنصر  " , Colors.grey.shade800);
//
//               }
//
//             },
//
//             child:
//               IndexedStack(
//                 index: currentIndex,
//                 children: pages,
//               )
//
//           ),
//         ),
//         bottomNavigationBar: CustomBottomNavigationBar(
//           currentIndex: currentIndex,
//           onItemSelected: (index) {
//             setState(() {
//               currentIndex = index;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_cubits/cart_cubit.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_cubits/cart_states.dart';
import 'package:fruits_hub/Features/ProductsView/presentation/views/products_view.dart';
import 'package:fruits_hub/Features/Profile/presentation/views/widgets/profile_view_body.dart';
import 'package:fruits_hub/Shared/error_success_snack_bar.dart';

import '../../../../Profile/presentation/views/profile_view.dart';
import '../cart_view.dart';
import 'custom_bottom_navigation_bar.dart';
import 'home_view_body.dart';

class HomeRootView extends StatefulWidget {
  const HomeRootView({super.key});

  @override
  State<HomeRootView> createState() => _HomeRootViewState();
}

class _HomeRootViewState extends State<HomeRootView> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeViewBody(),
    const ProductsView(),
    CartView(),
    ProfileView(),

    // SearchView(),
    // CartView(),
    // ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<CartCubit , CartStates>(
          listener: (context , state){

            if(state is CartItemAdded){

              errorAndSuccessSnackBar(context, "تم اضافه المنتج الى سلة التسوق بنجاح" , Colors.green);

            }  if(state is CartItemRemoved){

              errorAndSuccessSnackBar(context, "تم حذف العنصر  " , Colors.grey.shade800);

            }

          },

          child:
            IndexedStack(
              index: currentIndex,
              children: pages,
            )

        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}