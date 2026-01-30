import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_hub/Core/constants/textStyles.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/offers_button.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

class OffersBannerItem extends StatelessWidget {
   OffersBannerItem({required this.image , required this.curveImage});

String image , curveImage;
  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;

    return ClipRRect(
      borderRadius: BorderRadius.circular(4.r),
      child: Stack(
        children: [
          Positioned(
            // top: 10,
            // left: 10,
            // right: 10,
            child: Container(
              width: 342.w,
              height: 158.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: SvgPicture.asset(
              curveImage,
              height: 158.h,
            ),
          ),
          Positioned(
            right: 20.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(25.h),
                Opacity(
                  opacity: 0.80,
                  child: Text(
                    'عروض العيد',
                    style: TextStyles.regular14.copyWith(
                      height: 1.60,
                      color: Colors.white,
                    ),
                  ),
                ),
                Gap(8.h),
      
                Text(
                  'خصم 25%',
                  style: TextStyles.bold19.copyWith(color: Colors.white),
                ),
      
                Gap(9.h),
      
                OffersButton(
                  background: Colors.white,
                  textColor: Color(0xFF1B5E37),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// SizedBox(
//
// width: itemWidth,
// child: AspectRatio(
// aspectRatio: 342/158,
// child: Stack(
//
// children: [
//
// Positioned(
// top: 0,
// left: 0,
// bottom: 0,
// right: itemWidth*.4,
// child: Image.asset("assets/images/offers_banner_background_image.png" , fit: BoxFit.fill,),
// ),
// Container(
// width: itemWidth *0.5,
// decoration: BoxDecoration(
// image: DecorationImage(image: svg.Svg("assets/images/green_with_curve_image.svg"))
// ),
// child: Padding(
// padding:  EdgeInsets.only(right: 33.h),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
//
//
// Gap(25.h),
// Opacity(
// opacity: 0.80,
// child: Text(
// 'عروض العيد',
// style: TextStyles.regular14.copyWith(height: 1.60 , color: Colors.white),
// ),
// ),
// Gap(8.h),
//
// Text(
// 'خصم 25%',
// style: TextStyles.bold19.copyWith( color: Colors.white),
// ),
//
// Gap(9.h),
//
//
// OffersButton(background: Colors.white, textColor: Color(0xFF1B5E37) , onTap: (){},),
//
// ],
// ),
// ),
// )
//
//
// ],
// ),
// ),
// );
