import 'package:flutter/material.dart';

class Cart {
  final String title, description;
  final List<String> images;
  final double rating, price;
  final int id;
  final bool isFavorite, isPopular;

  Cart({
    required this.id,
    required this.images,
    this.rating = 0.0,
    this.isFavorite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
        id: json['id'],
        images: ['images'],
        title: 'title',
        price: 0,
        description: 'description');
  }
}
