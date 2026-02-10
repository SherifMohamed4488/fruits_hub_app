import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/utils/app_keys.dart';
import 'package:fruits_hub/Features/Checkout/domain/order_entity.dart';
import 'package:fruits_hub/Features/Checkout/domain/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruits_hub/Features/Checkout/presentation/view_model/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/widgets/active_steps_item.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/widgets/checkout_steps_list_view.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/widgets/in_active_steps_item.dart';
import 'package:fruits_hub/Shared/custom_button.dart';
import 'package:fruits_hub/Shared/error_success_snack_bar.dart';
import 'package:fruits_hub/Shared/internal_custom_app_bar.dart';
import 'package:gap/gap.dart';

import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
late PageController pageController ;

List<String> getSteps =["الشحن" , "العنوان" , "الدفع" , ];
List<String> getNextButtonText =["التالي" , "التالي" , "الدفع عبر PayPal " , ];

@override
@override
void initState() {
  super.initState();

  pageController = PageController();

  pageController.addListener(() {
    setState(() {
      currentPageIndex = pageController.page!.round();
    });
  });
}

@override


int currentPageIndex = 0;
GlobalKey <FormState> _formKey = GlobalKey();

void _handleAddressValidation(BuildContext context) {
  if(_formKey.currentState!.validate()){

  _formKey.currentState!.save();

  pageController.animateToPage(
    currentPageIndex + 1, duration: Duration(milliseconds: 200,)
    , curve: Curves.bounceIn);
  }else{

    valueNotifier.value = AutovalidateMode.always;
  }
}

ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(AutovalidateMode.disabled);

void dispose() {
  pageController.dispose();
  valueNotifier.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          // InternalCustomAppBar(text: "الشحن", arrowVisible: true , showNotification: false,),
          Gap(20.h),
          CheckoutStepsListView(
            currentPageIndex: currentPageIndex,
            pageController: pageController,
          onTap: (index){

              if(index == 0){
                pageController.animateToPage(index, duration: Duration(milliseconds: 10), curve: Curves.easeIn);

              }else if(index == 1){

               if (context.read<OrderEntity>().payWithCash != null) {
                  pageController.animateToPage(index, duration: Duration(milliseconds: 10), curve: Curves.easeIn);
               }else{
                 errorAndSuccessSnackBar(context, "يرجى تحديد طريقة الدفع", Colors.grey.shade800);
               }

            }else{
                _handleAddressValidation(context);
              }
          }
          ),
          Gap(32.h),

          CheckoutStepsPageView(pageController: pageController, formKey: _formKey, valueListenabl: valueNotifier,),
          Gap(100.h),
          CustomButton(onPressed: (){
            FocusScope.of(context).unfocus();
           if(currentPageIndex == 0) {
              _handleShippingSectionValidation(context);

           }else if(currentPageIndex == 1){
             _handleAddressValidation(context);

           }else{
             // var orderEntity = context.read<OrderEntity>();
             // context.read<AddOrderCubit>().addOrder(order: orderEntity);
             _processPayment(context);
           }

          }, text: getNextButtonText[currentPageIndex]
          ),
          Gap(16.h),
        ],
      ),
    );


  }

  void _handleShippingSectionValidation(BuildContext context) {
    if (context
        .read<OrderEntity>()
        .payWithCash != null) {
      pageController.animateToPage(
          currentPageIndex + 1, duration: Duration(milliseconds: 200,)
          , curve: Curves.bounceIn); } else{

                 errorAndSuccessSnackBar(context, "يرجى تحديد طريقة الدفع", Colors.grey.shade800);
    };
  }
}
void _processPayment(BuildContext context){
  var orderEntity = context.read<OrderEntity>();
  PaypalPaymentEntity paypalPaymentEntity =PaypalPaymentEntity.fromEntity(orderEntity);

  var addOrderCubit = context.read<AddOrderCubit>();

  Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context) => PaypalCheckoutView(
      sandboxMode: true,
      clientId: kPaypalClientId,
      secretKey: kPaypalSecretKey,
      transactions:  [
        paypalPaymentEntity.toJson(),
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        Navigator.pop(context);
        addOrderCubit.addOrder(order: orderEntity);
        print("onSuccess: $params");
      },
      onError: (error) {
        print("onError: $error");
        Navigator.pop(context);
      },
      onCancel: () {
        print('cancelled:');
      },
    ),
  ));

}