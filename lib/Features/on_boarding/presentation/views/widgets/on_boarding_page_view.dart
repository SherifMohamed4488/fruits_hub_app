import 'package:flutter/material.dart';
import 'package:fruits_hub/Features/on_boarding/presentation/views/widgets/page_view_item.dart';

import '../../../../../gen/assets.gen.dart';



class OnBoardingPageView extends StatelessWidget {
  OnBoardingPageView({required this.pageController});

  PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          image: Assets.images.fruitBasketLogo.path,
          backgroundImage: Assets.images.backgroundOnBoardingItem1.path,
          titleAndSubtitle: Assets.images.textItem1.path,
          isVisible: true,
        ),
        PageViewItem(
          image: Assets.images.pineappleLogo.path,
          backgroundImage: Assets.images.backgroundOnBoardingItem2.path,
          titleAndSubtitle: Assets.images.textItem2.path,
          isVisible: false,
        ),
      ],
    );
  }
}

