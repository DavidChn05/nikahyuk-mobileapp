import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahyuk/models/user_model.dart';
import 'package:nikahyuk/screens/login_success/loginsuccess_screen.dart';

import '../../../components/defaultbutton.dart';
import '../../authentication/controllers/signup_controllers.dart';

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
          SizedBox(
            height: 20,
          ),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                try {
                  // Email & Password Authentification
                  // await SignUpController.instance
                  //     .createUserWithEmailAndPassword(
                  //   controller.email.text.trim(),
                  //   controller.password.text.trim(),
                  // );

                  final user = UserModel(
                      fullname: controller.fullname.text.trim(),
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim());
                  SignUpController.instance.createUser(user);
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
