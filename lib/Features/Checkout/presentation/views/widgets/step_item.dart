import 'package:flutter/material.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/widgets/active_steps_item.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/widgets/in_active_steps_item.dart';

class StepItem extends StatelessWidget {
   StepItem({required this.text , required this.index , required this.isActive});
String text , index ;
bool isActive ;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(firstChild: InActiveStepsItem(text: text, index: index),
        secondChild: ActiveStepsItem(text: text),
        crossFadeState: isActive ?CrossFadeState.showSecond : CrossFadeState.showFirst, duration: Duration(milliseconds: 300));
  }
}
