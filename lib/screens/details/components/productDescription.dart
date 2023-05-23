import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/product.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.product,
    required this.pressOnSeeMore,
  });

  final Product product;
  final GestureTapCallback pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            product.title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(15),
            width: 70,
            decoration: BoxDecoration(
              color: product.isFavorite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: Image.asset(
              "assets/icons/love.png",
              color: product.isFavorite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
              height: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 80,
          ),
          child: Text(
            product.description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: pressOnSeeMore,
            child: Row(
              children: [
                Text(
                  "See More Detail",
                  style: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
