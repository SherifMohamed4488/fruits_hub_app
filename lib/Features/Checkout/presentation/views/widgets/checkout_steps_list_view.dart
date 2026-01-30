import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/widgets/active_steps_item.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/widgets/step_item.dart';
import 'package:gap/gap.dart';

import '../../../../../Shared/error_success_snack_bar.dart';
import '../../../domain/order_entity.dart';

class CheckoutStepsListView extends StatelessWidget {
   CheckoutStepsListView({required this.currentPageIndex , required this.pageController, required this.onTap});
List<String> getSteps =["الشحن" , "العنوان" , "الدفع" ];
int currentPageIndex;
PageController pageController;

final ValueChanged <int> onTap ;

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: List.generate(getSteps.length, (index){
    return GestureDetector(
      onTap: (){
       onTap(index);

      },
      child: StepItem(

        isActive: index <= currentPageIndex ,
        index : (index +1).toString() ,
        text: getSteps[index],
      ),
    );

    }
    ));
  }
}
// Expanded(
// child: ListView.separated(
// padding: EdgeInsets.zero,
// physics: const BouncingScrollPhysics(),
// scrollDirection: Axis.horizontal,
// itemCount: 4,
// itemBuilder: (context, index) {
// return const ActiveStepsItem();
// },
// separatorBuilder: (context, index) => Gap(10.w),
// ),
// );