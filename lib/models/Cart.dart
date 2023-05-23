import 'package:flutter/material.dart';
import 'package:nikahyuk/models/product.dart';

class Cart {
  Cart({required this.product, required this.numOfItems});

  final Product product;
  final int numOfItems;
}

List<Cart> charts = [
  Cart(product: listProducts[0], numOfItems: 3),
  Cart(product: listProducts[1], numOfItems: 2),
  Cart(product: listProducts[3], numOfItems: 1),
];
