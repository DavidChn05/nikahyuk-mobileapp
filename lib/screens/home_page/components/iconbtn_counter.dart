import 'package:flutter/material.dart';

import '../../../constants.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    super.key,
    required this.iconSrc,
    this.numOfItems = 0,
    required this.press,
  });

  final IconData iconSrc;
  final int numOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(25),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(25)),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                prefixIcon: Icon(iconSrc as IconData?),
              ),
            ),
          ),
          if (numOfItems != 0)
            Positioned(
              top: -2,
              right: 0,
              child: Container(
                height: 17,
                width: 17,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                    border: Border.all(width: 1.6, color: Colors.white)),
                child: Center(
                  child: Text(
                    "$numOfItems",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        height: 0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
