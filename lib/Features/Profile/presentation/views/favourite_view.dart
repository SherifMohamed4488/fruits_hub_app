import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/favourite_cubit/favourite_cubit.dart';
import 'package:fruits_hub/Features/Home/presentation/view_model/cubits/favourite_cubit/favourite_states.dart';
import 'package:fruits_hub/Features/Profile/presentation/views/widgets/favourote_view_widgets/favourite_item_grid_view.dart';
import 'package:gap/gap.dart';

import '../../../../Core/constants/textStyles.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});
  static const routeName = "favourite";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'المفضلة',
          textAlign: TextAlign.center,
          style: TextStyles.bold19.copyWith(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<FavouriteCubit , FavouriteState>(
          builder:(context , state) => Column(
            children: [
              Gap(28.h),
              FavouriteItemGridView(),

            ],

          ),
        ),
      ),
    );
  }
}
