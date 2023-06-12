import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahyuk/screens/authentication/repository/carts_repository.dart';

import '../../../models/carts.dart';

// class CartController extends GetxController {
//   static CartController get instance => Get.find();

//   final image = TextEditingController();
//   final title = TextEditingController();
//   final price = TextEditingController();
//   final description = TextEditingController();

//   final productRepo = Get.put(CartsRepository());

//   void addCart(String title, double price, String description) {
//     CartsRepository.instance.addCarts(title, price, description);
//   }

//   Future<void> addCarts(Cart product) async {
//     await productRepo.addCarts(user);
//     addCart(product.email, product.password);
//     Get.to(() => const LoginSuccessScreen());
//   }
// }

// "Title": title,
//       "Price": price,
//       "Description": description,