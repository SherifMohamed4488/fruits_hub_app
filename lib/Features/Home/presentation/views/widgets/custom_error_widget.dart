import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
   CustomErrorWidget({required this.text});

  String text ;
  @override
  Widget build(BuildContext context) {
    return Center(
      
      child: Text(text),
    );
  }
}
