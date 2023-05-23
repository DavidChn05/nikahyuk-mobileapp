import 'package:flutter/material.dart';
import 'package:nikahyuk/constants.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key,
    required this.text,
    required this.image,
  });
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "Nikah YUK",
          style: TextStyle(
              fontSize: 36, color: kPrimaryColor, fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: 265,
          width: 235,
        ),
      ],
    );
  }
}
