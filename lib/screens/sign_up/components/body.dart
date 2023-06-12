import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahyuk/components/hasaccount_screen.dart';
import 'package:nikahyuk/screens/authentication/controllers/signup_controllers.dart';
import 'package:nikahyuk/screens/sign_up/components/registerform.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
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
                  "Register Account \nNikah YUK",
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
                  "Sign Up with Name, Email and Password \n or continue with Social Media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 60,
                ),
                SignUpForm(),
                SizedBox(height: 25),
                HasAccountScreen(),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "By you continue your confirm that\n you agree with our Term and Condition",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
