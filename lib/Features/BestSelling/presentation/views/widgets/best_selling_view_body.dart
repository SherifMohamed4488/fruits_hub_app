import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/cubits/products_states.dart';
import 'package:fruits_hub/Features/BestSelling/presentation/views/widgets/best_selling_full_grid_view.dart';
import 'package:fruits_hub/Shared/internal_custom_app_bar.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/constants/textStyles.dart';
import '../../../../../Core/cubits/products_cubit.dart';
import '../../../../Home/presentation/views/widgets/best_selling_grid_view.dart';
import '../../../../Home/presentation/views/widgets/custom_error_widget.dart';

class BestSellingViewBody extends StatefulWidget {
  const BestSellingViewBody({super.key});

  @override
  State<BestSellingViewBody> createState() => _BestSellingViewBodyState();
}

class _BestSellingViewBodyState extends State<BestSellingViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getBestSellingProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InternalCustomAppBar(
            text: "الأكثر مبيعًا",
            arrowVisible: true,
          ),
          Gap(28.h),
          Text(
            "الأكثر مبيعًا",
            style: TextStyles.bold16.copyWith(
              color: const Color(0xFF0C0D0D),
            ),
          ),
          Gap(8.h),

          BlocBuilder<ProductsCubit, ProductsStates>(
            builder: (context, state) {
              if (state is ProductsSuccess) {
                return BestSellingFullGridView(products: state.products);
              }

              if (state is ProductsFailure) {
                return CustomErrorWidget(text: state.message);
              }

              // Loading يظهر فقط لأول مرة لو الكاش فاضي
              return const Center(child: CircularProgressIndicator());
            },
          )


        ],
      ),
    );
  }
}
