import 'package:flutter/material.dart';
import 'package:nikahyuk/components/defaultbutton.dart';
import 'package:nikahyuk/screens/home_page/homepage.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
        ),
        Image.asset(
          "assets/images/success.png",
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          "Login Success",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Spacer(),
        SizedBox(
          width: 200,
          child: DefaultButton(
            text: "Back to home",
            press: () {
              Navigator.pushNamed(context, HomePageScreen.routeName);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
