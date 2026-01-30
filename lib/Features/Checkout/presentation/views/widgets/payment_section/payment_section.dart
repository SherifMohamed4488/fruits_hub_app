import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';
import 'package:fruits_hub/Features/Checkout/domain/order_entity.dart';
import 'package:gap/gap.dart';

class PaymentSection extends StatelessWidget {
   PaymentSection({required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ملخص الطلب :',
          style: TextStyles.bold13.copyWith(color: const Color(0xFF0C0D0D)),
        ),

        Gap(8.h),

        Container(
          width: 342.w,
          height: 128.h,
          padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 5.h),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0x7FF2F3F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Gap(15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'المجموع الفرعي :',
                    style: TextStyles.regular13.copyWith(
                      color: const Color(0xFF4E5556),
                      height: 1.60,
                    ),
                  ),
                  Text(
                    '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()} جنيه',
                    textAlign: TextAlign.right,
                    style: TextStyles.semiBold16.copyWith(
                      color: const Color(0xFF0C0D0D),
                      height: 1.40,
                    ),
                  ),
                ],
              ),
              Gap(8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'التوصيل  :',
                    style: TextStyles.regular13.copyWith(
                      color: const Color(0xFF4E5556),
                      height: 1.60,
                    ),
                  ),
                  Text(
                    '40 جنيه',
                    textAlign: TextAlign.right,
                    style: TextStyles.semiBold13.copyWith(
                      color: const Color(0xFF4E5556),
                      height: 1.70,
                    ),
                  ),
                ],
              ),
              Gap(8.h),
              Container(
                width: 274.w,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.50,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: const Color(0xFFCACECE) /* Grayscale-200 */,
                    ),
                  ),
                ),
              ),
              Gap(8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الكلي',
                    style: TextStyles.bold16.copyWith(
                      color: const Color(0xFF0C0D0D),
                    ),
                  ),
                  Text(
                    '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()+40} جنيه',
                    textAlign: TextAlign.right,
                    style: TextStyles.bold16.copyWith(
                      color: const Color(0xFF0C0D0D),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Gap(16.h),

        Text(
          'يرجي تأكيد  طلبك',
          style: TextStyles.bold13.copyWith(color: const Color(0xFF0C0D0D)),
        ),
        Gap(8.h),

        // Container(
        //
        //   width: 343.w,
        //   height: 82.h,
        //   padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
        //   clipBehavior: Clip.antiAlias,
        //   decoration: ShapeDecoration(
        //     color: const Color(0x7FF2F3F3),
        //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        //   ),
        //   child: Column(
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //             'وسيلة الدفع',
        //             style: TextStyles.bold13.copyWith()
        //           ),
        //
        //           Row(
        //             children: [
        //               Icon(Icons.edit ,color: Colors.grey,),
        //               Text(
        //                 'تعديل',
        //                 style: TextStyles.semiBold13.copyWith(color: const Color(0xFF949D9E) , height: 1.70),
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //
        //       Row(
        //         children: [
        //
        //           Text(
        //             '**** **** **** 6522',
        //             style: TextStyles.regular16.copyWith( color: const Color(0xFF4E5556) , height: 1.40)
        //           ),
        //           Gap(0.w),
        //
        //           Image.asset("assets/images/visa2_badge.png"),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        Gap(8.h),
        Container(
          width: 341.w,
          height: 65.h,
          padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 5.h),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0x7FF2F3F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'عنوان التوصيل',
                    style:TextStyles.bold13.copyWith(color: Colors.black)
                  ),
                  Gap(8.h),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(
                        '${context.read<OrderEntity>().shippingAddressEntity}',
                        textAlign: TextAlign.right,
                        style: TextStyles.regular16.copyWith(
                          color: const Color(0xFF4E5556),
                          height: 1.40,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: (){
pageController.animateToPage(1, duration: Duration(milliseconds: 50), curve: Curves.easeIn);
                },
                child: Row(
                  children: [
                    Icon(Icons.edit, color: Colors.grey , size: 16.sp,),
                    Gap(2.w),
                    Text(
                      'تعديل',
                      style: TextStyles.semiBold13.copyWith(
                        color: const Color(0xFF949D9E),
                        height: 1.70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
