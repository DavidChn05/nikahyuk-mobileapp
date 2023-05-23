import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      width: double.infinity,
      // height: 90,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 133, 173),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text.rich(
        TextSpan(
            text: "Wedding With Your Partner\n",
            style: TextStyle(color: Colors.white, fontSize: 20),
            children: [
              TextSpan(
                text: "Cashback 20%",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
      ),
    );
  }
}
