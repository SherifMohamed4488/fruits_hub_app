import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Features/BestSelling/presentation/views/widgets/best_selling_full_grid_view.dart';
import 'package:fruits_hub/Shared/internal_custom_app_bar.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/constants/textStyles.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          InternalCustomAppBar(text: "الأكثر مبيعًا" , arrowVisible: true,),
          Gap(28.h),
          Text(
              "الأكثر مبيعًا",
              textAlign: TextAlign.center,
              style: TextStyles.bold19.copyWith(color: const Color(0xFF0C0D0D))
          ),
          Gap(8.h),

          BestSellingFullGridView(),
        ],
      ),
    );
  }
}
