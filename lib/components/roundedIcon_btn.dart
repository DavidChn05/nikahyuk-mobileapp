import 'package:flutter/material.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    super.key,
    required this.iconData,
    required this.press,
  });

  final IconData iconData;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: IconButton(
        style: ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.zero),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        onPressed: press,
        icon: Icon(iconData),
        color: Colors.black,
      ),
    );
  }
}
