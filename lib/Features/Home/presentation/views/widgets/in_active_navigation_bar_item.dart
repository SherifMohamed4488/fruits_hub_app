import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InActiveNavigationBarItem extends StatelessWidget {
  InActiveNavigationBarItem({required this.image});

  String image ;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: SvgPicture.asset(image));
  }
}