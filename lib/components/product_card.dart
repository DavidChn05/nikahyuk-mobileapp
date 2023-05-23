import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.width = 140,
    this.aspectRation = 1.02,
    required this.product,
    required this.press,
  });

  final double width, aspectRation;
  final Product product;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: width,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRation,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(
                    product.images[0],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                product.title,
                style: TextStyle(color: Colors.black),
                maxLines: 2,
                textAlign: TextAlign.left,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "IDR ${product.price}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: product.isFavorite
                            ? kPrimaryColor.withOpacity(0.15)
                            : kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        "assets/icons/love.png",
                        color: product.isFavorite
                            ? Color(0xFFFF4848)
                            : Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
