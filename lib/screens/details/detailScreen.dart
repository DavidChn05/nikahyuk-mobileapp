import 'package:flutter/material.dart';
import 'package:nikahyuk/models/product.dart';
import 'package:nikahyuk/screens/home_page/homepage.dart';

import '../../components/roundedIcon_btn.dart';
import 'components/body.dart';
import 'components/costumAppBar.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CostumAppBar(
        rating: arguments.product.rating,
      ),
      body: Body(product: arguments.product),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
