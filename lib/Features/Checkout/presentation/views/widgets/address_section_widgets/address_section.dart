import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Features/Checkout/domain/order_entity.dart';
import 'package:fruits_hub/Shared/custom_text_form_field.dart';
import 'package:gap/gap.dart';

class AddressSection extends StatelessWidget {
   AddressSection({required this.formKey , required this.valueListenabl , });
GlobalKey <FormState> formKey;

   final ValueListenable<AutovalidateMode> valueListenabl;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AutovalidateMode>(
      valueListenable:valueListenabl ,
      builder: (context , value, child) =>
       Form(
        key: formKey,
        autovalidateMode: value,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                CustomTextFormField(
                  hintText: "الاسم كامل",
                  textInputType: TextInputType.name,
                  onSaved: (value){

                    context.read<OrderEntity>().shippingAddressEntity!.name = value;
                  },
                ),
                Gap(8.h),
                CustomTextFormField(
                    onSaved: (value){

                      context.read<OrderEntity>().shippingAddressEntity!.email = value;
                    },
                    hintText: "البريد الإلكتروني",
                    textInputType: TextInputType.emailAddress),
                Gap(8.h),

                CustomTextFormField(
                    onSaved: (value){

                      context.read<OrderEntity>().shippingAddressEntity!.city = value;
                    },
                    hintText: "المدينه", textInputType: TextInputType.text),
                Gap(8.h),


                CustomTextFormField(
                    onSaved: (value){

                      context.read<OrderEntity>().shippingAddressEntity!.address = value;
                    },
                    hintText: "العنوان", textInputType: TextInputType.text),
                Gap(8.h),

                CustomTextFormField(
                    onSaved: (value){

                      context.read<OrderEntity>().shippingAddressEntity!.floor = value;
                    },
                    hintText: "رقم الطابق , رقم الشقه ..", textInputType: TextInputType.text),
                Gap(8.h),
                CustomTextFormField(
                    onSaved: (value){

                      context.read<OrderEntity>().shippingAddressEntity!.phone = value;
                    },
                    hintText: "رقم الهاتف", textInputType: TextInputType.text),
                Gap(16.h),
                // CustomTextFormField(hintText: "الاسم كامل", textInputType: TextInputType.emailAddress),

              ],
            ),
          ]

        ),
      ),
    );
  }
}
