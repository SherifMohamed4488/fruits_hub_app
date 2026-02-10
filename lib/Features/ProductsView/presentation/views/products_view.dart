import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_hub/Core/cubits/products_cubit.dart';
import 'package:fruits_hub/Features/ProductsView/presentation/views/widgets/products_view_body.dart';

import '../../../../Core/constants/textStyles.dart';
import '../../../../Core/repos/product_repo.dart';
import '../../../../Core/services/get_it_service.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});
  static const routeName = "products_view";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductRepo>()),
      child: Scaffold(

          appBar: AppBar(

            backgroundColor: Colors.white,
            centerTitle: true,
            title:Row(
              children: [

                Spacer(flex: 3,),
                Padding(
                  padding:  EdgeInsets.only(left: 8.0.w),
                  child: Text(
                      "المنتجات",
                      // textAlign: TextAlign.center,
                      style: TextStyles.bold19.copyWith(color: const Color(0xFF0C0D0D))
                  ),
                ),

                // Gap(showNotification ? 107.w : 0.w ),
                Spacer(flex: 2,),

                Container(
                  width: 35.w,
                  height: 35.h,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFEEF8ED) /* green-50 */,
                    shape: OvalBorder(),
                  ),

                  child: Center(child: SvgPicture.asset("assets/images/bell_logo.svg")),
                ),


              ],
            )
          ),
          body: SafeArea(child: ProductsViewBody())),
    );
  }
}
