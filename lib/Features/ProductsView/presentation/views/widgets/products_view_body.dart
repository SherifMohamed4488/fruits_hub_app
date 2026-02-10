import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruits_hub/Core/cubits/products_states.dart';
import 'package:fruits_hub/Core/entities/product_entity.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/search_text_field.dart';
import 'package:fruits_hub/Features/ProductsView/presentation/views/widgets/products_grid_view.dart';
import 'package:fruits_hub/Features/ProductsView/presentation/views/widgets/products_grid_view_bloc_builder.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../Core/constants/textStyles.dart';
import '../../../../../Core/cubits/products_cubit.dart';
import '../../../../../Shared/internal_custom_app_bar.dart';
import '../../../../BestSelling/presentation/views/widgets/best_selling_full_grid_view.dart';
import '../../../../Home/presentation/views/widgets/custom_error_widget.dart';
import '../../../../Home/presentation/views/widgets/get_dummy_product.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  // List<ProductEntity> products = [];
TextEditingController controller = TextEditingController();
List<ProductEntity> allProducts = [];
List<ProductEntity> products = [];
bool _isInitialized = false;

  @override
  void initState() {
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // products = context.select<ProductsCubit, List<ProductEntity>>((cubit) {
    //   final state = cubit.state;
    //   if (state is ProductsSuccess) {
    //     return state.products;
    //   }
    //   return [];
    // });
    //
    // allProducts = context.select<ProductsCubit, List<ProductEntity>>((cubit) {
    //   final state = cubit.state;
    //   if (state is ProductsSuccess) {
    //
    //     return state.products;
    //   }
    //   return [];
    // });
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocBuilder<ProductsCubit, ProductsStates>(
        builder: (context, state) {
          if (state is ProductsSuccess) {
            if (!_isInitialized) {
              allProducts = state.products;
              products = state.products;
              _isInitialized = true;
            }
            return GestureDetector(
              behavior: HitTestBehavior.translucent, // 👈 هذا هو المفتاح
              onTap: (){
                FocusScope.of(context).unfocus();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // InternalCustomAppBar(
                  //   text: "المنتجات",
                  //   arrowVisible: false,
                  //   showNotification: true,
                  // ),
                  Gap(16.h),
                  SearchTextField(
                    controller: controller,
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
                  ),
                  Gap(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${products.length} نتائج',
                        textAlign: TextAlign.right,
                        style: TextStyles.bold16.copyWith(
                          color: const Color(0xFF0C0D0D),
                        ),
                      ),

                      Container(
                        width: 44.w,
                        height: 31.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
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
                        child: SvgPicture.asset("assets/images/arrow_filter_icon.svg" ,),
                        // SvgPicture.asset("assets/images/arrow_filter.svg" , fit: BoxFit.fill,),
                      ),
                    ],
                  ),

                  // Text(
                  //     "المنتجات",
                  //     textAlign: TextAlign.center,
                  //     style: TextStyles.bold19.copyWith(color: const Color(0xFF0C0D0D))
                  // ),
                  Gap(8.h),

                  ProductsGridView(products: products),
                ],
              ),
            );
          } else if (state is ProductsFailure) {
            return SliverToBoxAdapter(
              child: CustomErrorWidget(text: state.message),
            );
          } else {
            return Skeletonizer.sliver(
              enabled: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InternalCustomAppBar(
                    text: "المنتجات",
                    arrowVisible: false,
                    showNotification: true,
                  ),
                  Gap(16.h),
                  SearchTextField(),
                  Gap(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${context.read<ProductsCubit>().productsLength} نتائج',
                        textAlign: TextAlign.right,
                        style: TextStyles.bold16.copyWith(
                          color: const Color(0xFF0C0D0D),
                        ),
                      ),

                      Container(
                        width: 44.w,
                        height: 31.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 8.h,
                        ),
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
                        child: Center(
                          child: Icon(
                            CupertinoIcons.arrow_up_arrow_down_square_fill,
                            color: Colors.grey,
                          ),
                        ),
                        // SvgPicture.asset("assets/images/arrow_filter.svg" , fit: BoxFit.fill,),
                      ),
                    ],
                  ),

                  // Text(
                  //     "المنتجات",
                  //     textAlign: TextAlign.center,
                  //     style: TextStyles.bold19.copyWith(color: const Color(0xFF0C0D0D))
                  // ),
                  Gap(8.h),

                  ProductsGridView(products: getDummyAllProducts()),
                ],
              )
            );
          }
        },
      ),
    );
  }
}
