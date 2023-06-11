import 'package:flutter/material.dart';
import 'components/body.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});
  static String routeName = "/myaccount";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Account"),
      ),
      body: Body(),
    );
  }
}
