import 'package:flutter/material.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const routeName = "signUp";
  @override
  Widget build(BuildContext context) {
    return SignUpViewBody();
  }
}
