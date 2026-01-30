import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(
        )),
        SizedBox(width: 18.w,),
        Text(
            'أو',
            style:TextStyles.semiBold16.copyWith(height: 1.40 ,
                color: const Color(0xFF0C0D0D))
        ),
        SizedBox(width: 18.w,),


        Expanded(child: Divider(
        )),
      ],
    );
  }
}
