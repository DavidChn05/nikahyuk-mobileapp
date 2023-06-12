import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/defaultbutton.dart';
import '../../../../constants.dart';
import '../../../authentication/controllers/signup_controllers.dart';
import '../../../forgot_password/forgotpassword_screen.dart';
import '../../../login_success/loginsuccess_screen.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final controller = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: 30,
          ),
          buildPasswordFormField(),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Checkbox(
                checkColor: Colors.white,
                fillColor: MaterialStatePropertyAll(kPrimaryColor),
                value: remember,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // DefaultButton(
          //   text: "Continue",
          //   press: () {
          //     if (_formKey.currentState!.validate()) {
          //       SignUpController.instance.registerUser(
          //           controller.email.text.trim(),
          //           controller.password.text.trim());
          //     }
          //     // setState(() {
          //     //   Navigator.pushNamed(context, LoginSuccessScreen.routeName);
          //     // });
          //   },
          // ), //MASIH BINGUNG CARANYA
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: controller.email.text.trim(),
                    password: controller.password.text.trim());
              } else {
                null;
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "enter your name";
        } else
          null;
      },
      controller: controller.fullname,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "Full Name",
        hintText: "Enter your name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "enter your email";
        } else
          null;
      },
      controller: controller.email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "enter your password";
        } else
          null;
      },
      controller: controller.password,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      obscureText: true,
    );
  }
}
