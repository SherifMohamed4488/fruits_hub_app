import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruits_hub/Core/entities/product_entity.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/search_text_field.dart';
import 'package:fruits_hub/Features/ProductsView/presentation/views/widgets/products_grid_view.dart';
import 'package:fruits_hub/Features/ProductsView/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/constants/textStyles.dart';
import '../../../../../Core/cubits/products_cubit.dart';
import '../../../../../Shared/internal_custom_app_bar.dart';
import '../../../../BestSelling/presentation/views/widgets/best_selling_full_grid_view.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts() ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          InternalCustomAppBar(text: "المنتجات" , arrowVisible: false, showNotification: true,),
          Gap(16.h),
          SearchTextField(),
          Gap(16.h),
          Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.read<ProductsCubit>().productsLength} نتائج',
                textAlign: TextAlign.right,
                style:TextStyles.bold16.copyWith(color: const Color(0xFF0C0D0D))
              ),

              Container(
                width: 44.w,
                height: 31.h,
                padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: ShapeDecoration(
                  color: Colors.white.withValues(alpha: 0.10),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: const Color(0x66CACECE),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Center(child: Icon(CupertinoIcons.arrow_up_arrow_down_square_fill , color: Colors.grey,))
                // SvgPicture.asset("assets/images/arrow_filter.svg" , fit: BoxFit.fill,),
              )
            ]
          ),

          // Text(
          //     "المنتجات",
          //     textAlign: TextAlign.center,
          //     style: TextStyles.bold19.copyWith(color: const Color(0xFF0C0D0D))
          // ),
          Gap(8.h),

        ProductsGridViewBlocBuilder(),
        ],
      ),
    );;
  }
}
