import 'package:flutter/material.dart';

import '../Core/constants/textStyles.dart';

void errorAndSuccessSnackBar(BuildContext context , String message , Color backgroundColor ) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(

      SnackBar(
        duration: Duration(milliseconds: 2100),
        behavior: SnackBarBehavior.floating,
          backgroundColor:backgroundColor ?? Colors.grey,
          content: Text(message, style: TextStyles.regular12.copyWith(color: Colors.white),)),
    );
}