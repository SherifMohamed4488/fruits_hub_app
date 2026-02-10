import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/Core/constants/app_colors.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';
import 'package:fruits_hub/Core/entities/product_entity.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/favourite_cubit/favourite_cubit.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/favourite_cubit/favourite_states.dart';
import 'package:fruits_hub/Features/ProductsView/presentation/views/product_details_view.dart';
import 'package:gap/gap.dart';

import '../../view_model/cubits/cart_cubits/cart_cubit.dart';

// class FruitItem extends StatefulWidget {
//    FruitItem({required this.productEntity});
//
// ProductEntity productEntity ;
//
//   @override
//   State<FruitItem> createState() => _FruitItemState();
// }
//
// class _FruitItemState extends State<FruitItem> {
//    bool isFavourite = false;
//
//    @override
//   Widget build(BuildContext context) {
//
//     return BlocBuilder<FavouriteCubit , FavouriteState>(
//
//       builder:(context , state)
//
//       {
//         final favCubit2 = BlocProvider.of<FavouriteCubit>(context);
//         final isFav2 = favCubit2.items.any((p) => p.promoCode == widget.productEntity.promoCode);
//
//
//         return GestureDetector(
//           onTap: (){
//             Navigator.pushNamed(
//               context,
//               ProductDetailsView.routeName,
//               arguments: widget.productEntity,
//             );
//           },
//           child: Container(
//
//           width: 172.w,
//           height: 225.h,
//           decoration: ShapeDecoration(
//             color: const Color(0xFFF3F5F7),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(4.r)),
//           ),
//
//           child: Padding(
//             padding: EdgeInsets.all(8.sp),
//             child: Column(
//
//               crossAxisAlignment: CrossAxisAlignment.start,
//
//               children: [
//
//                 Gap(5.h),
//                 GestureDetector(
//                     onTap: () {
//                       final favCubit = context.read<FavouriteCubit>();
//
//                       if (isFav2) {
//                         favCubit.removeFromFavourites(widget.productEntity);
//                       } else {
//                         favCubit.addToFavourites(widget.productEntity);
//                       }
//                     },
//
//                     child: isFav2 ? Icon(
//                         CupertinoIcons.heart_fill, color: Color(0xffEB5757)) :
//                     Icon(CupertinoIcons.heart, color: const Color(0xFF292D32),)
//
//                 ),
//                 //
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 24.w),
//                   child: Image.network(widget.productEntity.imageUrl ?? "https://th.bing.com/th/id/OIP.nRRnjzUxCAAN9Kz4XnLugQHaFj?w=271&h=203&c=7&r=0&o=7&pid=1.7&rm=3", height: 105.h, width: 114.w,),
//                 ),
//                 // Gap(24.h),
//                 Spacer(),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 4.w),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                               widget.productEntity.productName,
//                               textAlign: TextAlign.right,
//                               style: TextStyles.semiBold13.copyWith(
//
//                                 color: const Color(0xFF0C0D0D),
//                                 height: 1.70,
//                               )
//                           ),
//                           Gap(2.h),
//                           Text(
//
//                               '${widget.productEntity.price}جنية / الكيلو ',
//                               style: TextStyles.semiBold13.copyWith(
//
//                                 color: const Color(0xFFF4A91F),
//                                 height: 1.70,
//                               )
//                           ),
//                         ],
//                       ),
//                       // Gap(15.w),
//                       Spacer(),
//
//                       GestureDetector(
//                         onTap: () {
//                           context.read<CartCubit>().addProduct(widget
//                               .productEntity);
//                         },
//                         child: CircleAvatar(
//                           radius: 20.sp,
//                           backgroundColor: const Color(0xFF1B5E37),
//                           child: Icon(CupertinoIcons.add, color: Colors.white,),
//                         ),
//                       ),
//
//                     ],
//
//
//                   ),
//                 ),
//                 Spacer(),
//               ],
//             ),
//           ),
//
//                 ),
//         );
//       },
//     );
//   }
// }
class FruitItem extends StatelessWidget {
  final ProductEntity productEntity;

  const FruitItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit, FavouriteState>(
      builder: (context, state) {
        final isFav = state is FavouriteUpdated &&
            state.items.any(
                  (p) => p.promoCode == productEntity.promoCode,
            );

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              ProductDetailsView.routeName,
              arguments: productEntity,
            );
          },
          child: Container(
            width: 172.w,
            // 172.w original
            height: 225.h,
            decoration: ShapeDecoration(
              color: const Color(0xFFF3F5F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(7.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(5.h),

                  /// ❤️ Favourite Button
                  GestureDetector(
                    onTap: () {
                      final favCubit = context.read<FavouriteCubit>();
                      if (isFav) {
                        favCubit.removeFromFavourites(productEntity);
                      } else {
                        favCubit.addToFavourites(productEntity);
                      }
                    },
                    child: Icon(
                      isFav
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: isFav
                          ? const Color(0xffEB5757)
                          : const Color(0xFF292D32),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Image.network(
                      productEntity.imageUrl ??
                          "https://via.placeholder.com/150",
                      height: 105.h,
                      width: 114.w,
                    ),
                  ),

                  const Spacer(
                    flex: 2,
                  ),

                  /// Product info
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productEntity.productName,
                              style: TextStyles.semiBold13.copyWith(
                                color: const Color(0xFF0C0D0D),
                              ),
                            ),
                            Gap(2.h),
                            Text(
                              '${productEntity.price} جنية / الكيلو',
                              style: TextStyles.semiBold13.copyWith(
                                color: const Color(0xFFF4A91F),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(

                        ),

                        /// 🛒 Add to cart
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .addProduct(productEntity);
                          },
                          child: CircleAvatar(
                            radius: 18.sp,
                            backgroundColor: const Color(0xFF1B5E37),
                            child: const Icon(
                              CupertinoIcons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 1,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
