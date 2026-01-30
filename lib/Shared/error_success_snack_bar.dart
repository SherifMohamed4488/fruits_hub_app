import 'package:flutter/material.dart';

void errorAndSuccessSnackBar(BuildContext context , String message , Color backgroundColor ) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(

      SnackBar(
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
          backgroundColor:backgroundColor ?? Colors.grey,
          content: Text(message,)),
    );
}