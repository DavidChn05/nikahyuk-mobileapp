import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahyuk/components/defaultbutton.dart';
import 'package:nikahyuk/constants.dart';
import 'package:nikahyuk/screens/authentication/controllers/signup_controllers.dart';
import 'package:nikahyuk/screens/forgot_password/forgotpassword_screen.dart';
import 'package:nikahyuk/screens/login_success/loginsuccess_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nikahyuk/screens/sign_in/notused/components/signinform.dart';

import '../../../../components/noaccount_screen.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Welcome Back to \nNikah YUK",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sign in with Email and Password \n or continue with Social Media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 60,
                ),
                SignInForm(),
                SizedBox(height: 25),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
