import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Features/Checkout/domain/order_entity.dart';
import 'package:fruits_hub/Features/Checkout/presentation/views/widgets/payment_item.dart';
import 'package:gap/gap.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> with AutomaticKeepAliveClientMixin{

  int selectedIndex = -1 ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ShippingItem(
          onTap: (){
            setState(() => selectedIndex = 0);
            context.read<OrderEntity>().payWithCash = true;
          },
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان' ,
          price: '${context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 40} جنيه',
        isSelected: selectedIndex == 0 ,
        ),
       Gap(8.h),
        ShippingItem(
          onTap: (){
            setState(() => selectedIndex = 1);
            context.read<OrderEntity>().payWithCash = false;
          },
          title: 'الدفع اونلاين ',
          subtitle: 'يرجي تحديد طريقه الدفع' ,
          price: '${context.read<OrderEntity>().cartEntity.calculateTotalPrice() } جنيه',
        isSelected: selectedIndex == 1,
        ),

      ],
    );

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
