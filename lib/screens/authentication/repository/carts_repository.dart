import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahyuk/models/user_model.dart';

class CartsRepository extends GetxController {
  static CartsRepository get instance => Get.find<CartsRepository>();

  final _cr = FirebaseFirestore.instance;

  addCarts(UserModel user, double price) async {
    await _cr
        .collection("Users")
        .add(user.toJson())
        .then((_) => Get.snackbar(
              "Success",
              "Your Account has been created.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
            ))
        .catchError((error) {
      print("Error: $error");
      Get.snackbar(
        "Error",
        "Something went wrong. Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    });
  }
}
