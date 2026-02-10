import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/cubits/products_cubit.dart';
import 'package:fruits_hub/Core/entities/product_entity.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/best_selling_grid_view_bloc_builder.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/search_text_field.dart';
import 'package:fruits_hub/Features/Profile/presentation/view_model/cubits/update_cubit.dart';
import 'package:fruits_hub/Features/Profile/presentation/view_model/cubits/update_states.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../Core/cubits/products_states.dart';
import '../../view_model/cubits/favourite_cubit/favourite_cubit.dart';
import 'best_selling_grid_view.dart';
import 'best_selling_header.dart';
import 'custom_error_widget.dart';
import 'get_dummy_product.dart';
import 'home_custom_app_bar.dart';
import 'offers_banners_list_view.dart';

//
class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<ProductEntity> allProducts = [];
  List<ProductEntity> products = [];
  bool _isInitialized = false;

  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    context.read<FavouriteCubit>().startFavouritesListener();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<UpdateCubit, UpdateStates>(
      builder:
          (context, state) => GestureDetector(
            behavior: HitTestBehavior.translucent, // 👈 هذا هو المفتاح
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: CustomScrollView(

              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      HomeCustomAppBar(),
                      Gap(16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: SearchTextField(
                            onChanged: (v) {
                              final query = v.trim(); // remove extra spaces
                              setState(() {
                                products = allProducts.where((ProductEntity p) {
                                  final name = p.productName.trim();
                                  return name.contains(query);
                                }).toList();

                                debugPrint("Filtered products: ${products.length}");
                              });
                            }


                            // setState(() {
                            //   products = allProducts?.where((p) => p.name.toLowerCase().contains(query),).toList();
                            //   debugPrint("Filtered products: ${products.length}");
                            // });

                        ),
                      ),
                      Gap(12.h),
                      OffersBannersListView(),
                      BestSellingHeader(),
                      Gap(12.5.h),
                    ],
                  ),
                ),

                // BestSellingGridViewBlocBuilder(),

                BlocBuilder<ProductsCubit, ProductsStates>(
                  builder: (context, state) {
                    if (state is ProductsSuccess) {

                      if (!_isInitialized) {
                        allProducts = state.products;
                        products = state.products;
                        _isInitialized = true;
                      }
                      return BestSellingGridView(products: products);
                    } else if (state is ProductsFailure) {
                      return SliverToBoxAdapter(
                        child: CustomErrorWidget(text: state.message),
                      );
                    } else {
                      return Skeletonizer.sliver(
                        enabled: true,
                        child: BestSellingGridView(
                          products: getDummyAllProducts(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
    );
  }
}

// class HomeViewBody extends StatefulWidget {
//   const HomeViewBody({super.key});
//
//   @override
//   State<HomeViewBody> createState() => _HomeViewBodyState();
// }
//
// class _HomeViewBodyState extends State<HomeViewBody> {
//   List<ProductEntity> allProducts = [];
//   List<ProductEntity> products = [];
//
//   @override
//   void initState() {
//     super.initState();
//     context.read<ProductsCubit>().getBestSellingProducts();
//   }
//
//   void _filterProducts(String query) {
//     setState(() {
//       products = allProducts
//           .where((p) => p.productName.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//       debugPrint("Filtered products: ${products.length}");
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<UpdateCubit, UpdateStates>(
//       builder: (context, updateState) {
//         return BlocBuilder<ProductsCubit, ProductsStates>(
//           builder: (context, state) {
//             if (state is ProductsLoading) {
//               return Skeletonizer.sliver(
//                 enabled: true,
//                 child: BestSellingGridView(products: getDummyAllProducts()),
//               );
//             } else if (state is ProductsFailure) {
//               return SliverToBoxAdapter(
//                 child: CustomErrorWidget(text: state.message),
//               );
//             } else if (state is ProductsSuccess) {
//               // update allProducts from cubit
//               allProducts = state.products;
//
//               // initialize products if empty (first load)
//               if (products.isEmpty) {
//                 products = allProducts;
//               }
//
//               return CustomScrollView(
//                 physics: const BouncingScrollPhysics(),
//                 slivers: [
//                   SliverToBoxAdapter(
//                     child: Column(
//                       children: [
//                         HomeCustomAppBar(),
//                         Gap(16.h),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 16.w),
//                           child: SearchTextField(onChanged: _filterProducts),
//                         ),
//                         Gap(12.h),
//                         OffersBannersListView(),
//                         BestSellingHeader(),
//                         Gap(12.5.h),
//                       ],
//                     ),
//                   ),
//                   products.isEmpty
//                       ? SliverToBoxAdapter(
//                     child: Center(child: Text("No products found")),
//                   )
//                       : BestSellingGridView(products: products),
//                 ],
//               );
//             }
//             return const SizedBox.shrink();
//           },
//         );
//       },
//     );
//   }
// }


// class HomeViewBody extends StatefulWidget {
//   const HomeViewBody({super.key});
//
//   @override
//   State<HomeViewBody> createState() => _HomeViewBodyState();
// }
//
// class _HomeViewBodyState extends State<HomeViewBody> {
//  @override
//   void initState() {
//     context.read<ProductsCubit>().getBestSellingProducts();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: CustomScrollView(
//
//         physics: BouncingScrollPhysics(),
//         slivers: [
//
//           SliverToBoxAdapter(child: Column(
//
//             children: [
//
//               HomeCustomAppBar(),
//               Gap(16.h),
//               SearchTextField(),
//               Gap(12.h),
//               OffersBannersListView(),
//               BestSellingHeader(),
//               // Gap(16.h),
//               // FruitItem(),
//               Gap(12.5.h),
//             ],
//           )),
//           BestSellingGridViewBlocBuilder(),
//
//         ],
//       ),
//       bottomSheet: CustomBottomNavigationBar(),
//
//
//     );
//   }
// }
