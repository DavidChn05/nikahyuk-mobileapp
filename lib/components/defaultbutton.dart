import 'package:flutter/material.dart';
import 'package:nikahyuk/constants.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    required this.press,
  });
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: press,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
