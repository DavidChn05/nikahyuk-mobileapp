import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/defaultbutton.dart';
import '../../../constants.dart';
import '../../authentication/controllers/signup_controllers.dart';
import '../../forgot_password/forgotpassword_screen.dart';

class SignFormUp extends StatefulWidget {
  const SignFormUp({super.key});
  @override
  State<SignFormUp> createState() => _SignFormUpState();
}

class _SignFormUpState extends State<SignFormUp> {
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
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                SignUpController.instance.registerUser(
                    controller.email.text.trim(),
                    controller.password.text.trim());
              }
              // setState(() {
              //   Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              // });
            },
          ), //MASIH BINGUNG CARANYA
          // DefaultButton(
          //   text: "Continue",
          //   press: () async {
          //     try {
          //       final UserCredential userCredential =
          //           await _auth.signInWithEmailAndPassword(
          //         email: email,
          //         password: password,
          //       );
          //       // SignIn berhasil, arahkan pengguna ke halaman sukses SignIn
          //       Navigator.pushNamed(context, LoginSuccessScreen.routeName);
          //     } catch (e) {
          //       // SignIn gagal, tampilkan pesan error kepada pengguna
          //       print(e.toString());
          //       // contoh menampilkan snackbar dengan pesan error
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //             content: Text('Failed to sign in. Please try again.')),
          //       );
          //     }
          //   },
          // ),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
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
