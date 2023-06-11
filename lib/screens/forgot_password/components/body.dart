import 'package:flutter/material.dart';
import 'package:nikahyuk/components/defaultbutton.dart';
import 'package:nikahyuk/components/noaccount_screen.dart';
import 'package:nikahyuk/screens/sign_in/notused/signin_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Forgot Password",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Please enter your email and we will send \n you a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 80,
              ),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({super.key});

  @override
  State<ForgotPassForm> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPassForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          DefaultButton(
              text: "Contunie",
              press: () {
                setState(() {
                  Navigator.popAndPushNamed(context, SignInScreen.routeName);
                });
              }),
          SizedBox(
            height: 75,
          ),
          NoAccountText(),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
