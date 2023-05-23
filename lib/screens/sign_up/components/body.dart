import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nikahyuk/components/defaultbutton.dart';
import 'package:nikahyuk/components/hasaccount_screen.dart';
import 'package:nikahyuk/constants.dart';
import 'package:nikahyuk/models/customer.dart';
import 'package:nikahyuk/screens/forgot_password/forgotpassword_screen.dart';
import 'package:nikahyuk/screens/sign_in/signin_screen.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../components/noaccount_screen.dart';
import '../../providers/customers.dart';

class Body extends StatelessWidget {
  const Body({super.key});

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
                SignForm(),
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

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool remember = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final customers = Provider.of<Customers>(context, listen: false);
    addCustomer() {
      customers
          .addCustomer(
        nameController.text,
        emailController.text,
        passwordController.text,
      )
          .then(
        (response) {
          print("Kembali ke Home & kasih notif snack bar");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Berhasil ditambahkan"),
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.pop(context);
        },
      ).catchError(
        (err) => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("TERJADI ERROR $err"),
            content: Text("Tidak dapat menambahkan player."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OKAY"),
              ),
            ],
          ),
        ),
      );
    }

    return Form(
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
            press: addCustomer,
          ),
        ],
      ),
    );
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Name",
        hintText: "Enter your name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      controller: nameController,
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
      controller: emailController,
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
      controller: passwordController,
    );
  }
}
