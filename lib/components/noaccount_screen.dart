import 'package:flutter/material.dart';
import 'package:nikahyuk/screens/sign_up/signup_screen.dart';

import '../constants.dart';
import '../screens/forgot_password/forgotpassword_screen.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () =>
              Navigator.popAndPushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Sign up here",
            style: TextStyle(
              fontSize: 16,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
