import 'package:flutter/material.dart';
import 'components/body.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static String routeName = "/sign_in";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign In",
          textAlign: TextAlign.center,
        ),
      ),
      body: Body(),
    );
  }
}
