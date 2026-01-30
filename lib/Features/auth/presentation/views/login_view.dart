import 'package:flutter/material.dart';
import 'package:fruits_hub/Features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});


  static const routeName = "login";
  @override
  Widget build(BuildContext context) {
    return LoginViewBody();
  }
}
