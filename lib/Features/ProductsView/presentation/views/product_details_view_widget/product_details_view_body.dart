import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';
import 'package:fruits_hub/Core/entities/product_entity.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/cart_cubits/cart_states.dart';
import 'package:fruits_hub/Features/ProductsView/presentation/views/product_details_view_widget/details_item.dart';
import 'package:fruits_hub/Shared/custom_button.dart';
import 'package:fruits_hub/Shared/error_success_snack_bar.dart';
import 'package:gap/gap.dart';

import '../../../../Home/presentation/view_model/cubits/cart_cubits/cart_cubit.dart';
import '../../../../Home/presentation/view_model/cubits/favourite_cubit/favourite_cubit.dart';
import '../../../../Home/presentation/view_model/cubits/favourite_cubit/favourite_states.dart';

class ProductDetailsViewBody extends StatelessWidget {
   ProductDetailsViewBody({ required this.productEntity});
ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return  BlocListener<CartCubit , CartStates>(
      listener: (context , state){
        if(state is CartItemAdded){
          errorAndSuccessSnackBar(context," تم اضافه المنتج الى سلة التسوق بنجاح", Colors.green);
        }
      },

        child:
           Stack(
            children: [


              Positioned(
                top: -525.h,
                left: -240.w,
                // optional, defaults to 0 if you want it aligned left
                child: SvgPicture.asset(
                  "assets/images/background_details_view2.svg",
                  height: 880.h,
                  width: 880.w,
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 442.h,
                child: Transform.translate(
                  offset: Offset(0, 5.h), // move down by 20.h
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: 110.h, top: 120.h, left: 110.w, right: 110.w),
                    child: Image.network(

                          productEntity.imageUrl!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              Positioned(
                right: 16.w,
                top: 50.h,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(
                        side: BorderSide(
                          width: 1,
                          color: const Color(0xFFF1F1F5),
                        ),
                      ),
                    ),
                    child: Center(child: SvgPicture.asset("assets/images/arrow_back_icon.svg" , height: 22.h , width: 22.w,)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 343.h, right: 16.w, left: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(24.h),
                    Text(
                        productEntity.productName,
                        textAlign: TextAlign.right,
                        style: TextStyles.bold16.copyWith(
                            color: const Color(0xFF0C0D0D))
                    ),
                    Gap(5.h),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: '${productEntity.price}جنية ',
                              style: TextStyles.bold13.copyWith(
                                  color: const Color(0xFFF4A91F))
                          ),
                          TextSpan(
                              text: '/',
                              style: TextStyles.bold13.copyWith(
                                  color: const Color(0xFFF8C76D))
                          ),
                          TextSpan(
                              text: ' ',
                              style: TextStyles.semiBold13.copyWith(
                                  color: const Color(0xFFF4A91F))
                          ),
                          TextSpan(
                              text: 'الكيلو',
                              style: TextStyles.semiBold13.copyWith(
                                  color: const Color(0xFFF8C76D))
                          ),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                    Gap(8.h),
                    Row(
                      children: [
                        Icon(Icons.star, color: Color(0xffFFC529),),
                        Gap(8.w),
                        Text(
                            '${productEntity.avgRating}',
                            style: TextStyles.semiBold13.copyWith(
                              height: 1.70, color: const Color(0xFF111719),)
                        ),
                        Gap(9.h),
                        Text(
                          '(${productEntity.ratingCount})',
                          style: TextStyles.regular13.copyWith(
                              color: const Color(0xFF9796A1), height: 1.60),

                        ),
                        Text(
                          ' المراجعه',
                          style: TextStyles.bold13.copyWith(
                              color: const Color(0xFF1B5E37)),
                        )
                      ],
                    ),
                    Gap(8.h),
                    Text("ينتمي إلى الفصيلة القرعية ولثمرته لُب حلو المذاق وقابل للأكل، وبحسب علم النبات فهي تعتبر ثمار لبيّة، تستعمل لفظة البطيخ للإشارة إلى النبات نفسه أو إلى الثمرة تحديداً",
                      style: TextStyles.regular13.copyWith(
                          color: const Color(0xFF969899), height: 1.60),

                    ),
                    Gap(16.h),
                    Row(
                      children: [
                        Column(
                          children: [
                            DetailsItem(text1: "${productEntity
                                .expirartionMounths} عام",
                                text2: "الصلاحيه",
                                image: "assets/images/year_icon.svg"),
                            Gap(16.h),
                            DetailsItem(text1: "${productEntity
                                .numberOfCalories} كالوري",
                                text2: "${productEntity.unitAmount} جرام",
                                image: "assets/images/calories_icon.svg"),
                          ],
                        ),
                        Gap(16.w),
                        Column(
                          children: [
                            DetailsItem(
                                text1: productEntity.isOrganic ? "100%" : "70%",
                                text2: productEntity.isOrganic
                                    ? "طبيعي"
                                    : "صناعي",
                                image: "assets/images/organic_icon.svg"),
                            Gap(16.h),
                            DetailsItem(text1: "${productEntity
                                .avgRating} (${productEntity.ratingCount})",
                                text2: "المراجعه",
                                image: "assets/images/star_icon.svg"),
                          ],
                        ),
                        // Spacer(),
                      ],
                    ),
                    Spacer(),
                    CustomButton(onPressed: () {
                      context.read<CartCubit>().addProduct(productEntity);
                    },
                        text: "أضف الي السلة"),
                    Gap(16.h),
                  ],
                ),
              )

            ],
          )


    );
  }
}
