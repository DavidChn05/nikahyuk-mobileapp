import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Cart.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.cart,
  });

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                cart.product.images[0],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              maxLines: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                  text: "\IDR ${cart.product.price}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                  children: [
                    TextSpan(
                      text: " x ${cart.numOfItems}",
                      style: TextStyle(color: kSecondaryColor),
                    ),
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}
