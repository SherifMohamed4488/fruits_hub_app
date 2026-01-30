import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/cubits/products_cubit.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/best_selling_grid_view_bloc_builder.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/search_text_field.dart';
import 'package:gap/gap.dart';

import 'best_selling_header.dart';
import 'home_custom_app_bar.dart';
import 'offers_banners_list_view.dart';

//
class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              HomeCustomAppBar(),
              Gap(16.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: SearchTextField(),
              ),
              Gap(12.h),
              OffersBannersListView(),
              BestSellingHeader(),
              Gap(12.5.h),
            ],
          ),
        ),
        BestSellingGridViewBlocBuilder(),
      ],
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


