import 'package:flutter/material.dart';

import '../constants.dart';
import '../screens/chart/components/mychart.dart';

class RoundedIconCounter extends StatelessWidget {
  const RoundedIconCounter({
    super.key,
    required this.iconData,
    required this.press,
  });

  final IconData iconData;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: kSecondaryColor.withOpacity(0.2),
          ),
        ),
        IconButton(
          icon: Icon(iconData),
          onPressed: press,
          color: kSecondaryColor,
        ),
      ],
    );
  }
}
