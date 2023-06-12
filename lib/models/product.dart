import 'package:flutter/material.dart';

class Product {
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final int id;
  final bool isFavorite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavorite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

List<Product> listProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/wedding_ring.png",
      "assets/images/wedding_ring.png",
      "assets/images/venue-indoor.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wedding ring couples - Gold",
    price: 273.000,
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque augue turpis, interdum nec ex sit amet, gravida faucibus nibh. Sed volutpat enim diam, sed varius mauris fringilla id.",
    rating: 4.5,
    isFavorite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/venue-indoor.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wedding venue indoor",
    price: 299.000,
    description: "description",
    rating: 4.8,
    isFavorite: false,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/venue-outdoor.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wedding venue outdoor",
    price: 289.000,
    description: "description",
    rating: 4.3,
    isFavorite: false,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/venue-indoor.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4",
    price: 275.000,
    description: "description",
    rating: 4.2,
    isFavorite: true,
    isPopular: true,
  ),
];

Product findById(productId) {
  return listProducts.firstWhere((prodId) => prodId.id == productId);
}
