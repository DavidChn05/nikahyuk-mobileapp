import 'package:flutter/material.dart';
import 'package:nikahyuk/screens/sign_in/notused/signin_screen.dart';
import 'package:nikahyuk/screens/sign_up/signup_screen.dart';

import '../constants.dart';
import '../screens/forgot_password/forgotpassword_screen.dart';

class HasAccountScreen extends StatelessWidget {
  const HasAccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "have an account? ",
          style: TextStyle(fontSize: 16),
        ),
        GestureDetector(
          onTap: () =>
              Navigator.popAndPushNamed(context, SignInScreen.routeName),
          child: Text(
            "Sign in here",
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
