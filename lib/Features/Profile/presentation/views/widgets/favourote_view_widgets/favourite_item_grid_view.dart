import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/favourite_cubit/favourite_cubit.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/favourite_cubit/favourite_states.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/fruit_item.dart';

import '../../../../../../Core/constants/textStyles.dart';

class FavouriteItemGridView extends StatelessWidget {
  const FavouriteItemGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          if (state is FavouriteUpdated && state.items.isNotEmpty) {
            final products = state.items;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 0.77,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return FruitItem(productEntity: products[index]);
                },
              ),
            );
          } else {
            return Center(
              child: Text(
                "المفضلة فارغه",
                style: TextStyles.bold19.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade500,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

