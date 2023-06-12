import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/defaultbutton.dart';
import '../../authentication/controllers/signup_controllers.dart';
import '../../authentication/repository/authentication_repository.dart';
import '../../authentication/repository/exceptions/signup_failure.dart';
import '../../forgot_password/forgotpassword_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final controller = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNameFormField(),
          SizedBox(
            height: 30,
          ),
          buildEmailFormField(),
          SizedBox(
            height: 30,
          ),
          buildPasswordFormField(),
          Row(
            children: [
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
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                try {
                  await SignUpController.instance
                      .createUserWithEmailAndPassword(
                    controller.email.text.trim(),
                    controller.password.text.trim(),
                  );
                } catch (e) {}
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
