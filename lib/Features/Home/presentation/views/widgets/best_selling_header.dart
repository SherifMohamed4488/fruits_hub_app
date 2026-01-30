import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Features/BestSelling/presentation/views/best_selling_view.dart';

import '../../../../../Core/constants/textStyles.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(children: [

        Text(
            'الأكثر مبيعًا',
            textAlign: TextAlign.right,
            style: TextStyles.bold16.copyWith(color: const Color(0xFF0C0D0D))
        ),



        Spacer(),

        GestureDetector(
          onTap: (){

            Navigator.pushNamed(context, BestSellingView.routeName);
          },
          child: Text(
            'المزيد',
          
            textAlign: TextAlign.center,
            style: TextStyles.regular13.copyWith(
          
              color: const Color(0xFF949D9E),
              height: 1.60,
          
            ),
          ),
        ),

      ],),
    );
  }
}
