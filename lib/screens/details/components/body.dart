import 'package:flutter/material.dart';
import 'package:nikahyuk/components/defaultbutton.dart';
import 'package:nikahyuk/constants.dart';
import 'package:nikahyuk/models/product.dart';
import 'package:nikahyuk/screens/chart/components/mychart.dart';

import 'productDescription.dart';
import 'productImages.dart';
import 'topRoundedContainer.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
            color: Colors.white,
            child: ProductDescription(
              product: product,
              pressOnSeeMore: () {},
            ),
          ),
          SizedBox(
            height: 100,
          ),
          TopRoundedContainer(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 10,
                bottom: 30,
              ),
              child: DefaultButton(
                text: "Add to Cart",
                press: () {
                  Navigator.pushNamed(context, MyChart.routeName);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
