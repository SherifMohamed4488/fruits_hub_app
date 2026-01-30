
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/widgets/address_section_widgets/address_section.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/widgets/payment_section/payment_section.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  CheckoutStepsPageView({
    required this.pageController,
    required this.formKey,
    super.key,
    required this.valueListenabl
  });

  final GlobalKey<FormState> formKey;
  final PageController pageController;
  final ValueListenable<AutovalidateMode> valueListenabl;


  List<Widget> get getPages => [
    ShippingSection(),
    AddressSection(formKey: formKey , valueListenabl: valueListenabl,),
    PaymentSection(pageController: pageController,),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: getPages.length,
        itemBuilder: (context, index) {
          return getPages[index];
        },
      ),
    );
  }
}

