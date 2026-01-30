import 'package:flutter/material.dart';
import 'package:fruits_hub/Features/Home/presentation/views/widgets/offers_banner_item.dart';

class OffersBannersListView extends StatelessWidget {
   OffersBannersListView({super.key});

List<OffersBannerItem> items = [

  OffersBannerItem(image:"assets/images/offers_banner_background_image.png" , curveImage: "assets/images/dark_green_with_curve_image.svg",) ,
  OffersBannerItem(image: "assets/images/offers_banner_background_image.png", curveImage: "assets/images/green_with_curve_image.svg",),
  OffersBannerItem(image:"assets/images/orange_offers_banner_background.png" , curveImage: "assets/images/orange_with_curve_image.svg")
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      child: Row(
        children: List.generate(items.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: items[index],
          );
      },
      ),)
    );
  }
}
