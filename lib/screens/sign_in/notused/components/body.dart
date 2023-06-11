import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nikahyuk/components/defaultbutton.dart';
import 'package:nikahyuk/constants.dart';
import 'package:nikahyuk/screens/forgot_password/forgotpassword_screen.dart';
import 'package:nikahyuk/screens/login_success/loginsuccess_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../../components/noaccount_screen.dart';
import 'package:nikahyuk/screens/providers/auth.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
                SignForm(),
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

class SignForm extends StatefulWidget {
  const SignForm({super.key});
  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
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
              setState(() {
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              });
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

  TextFormField buildEmailFormField() {
    return TextFormField(
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
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      obscureText: true,
    );
  }
}
