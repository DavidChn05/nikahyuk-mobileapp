import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahyuk/models/user_model.dart';
import 'package:collection/collection.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  ///store usear in firestore
  createUser(UserModel user) async {
    await _db
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

  /// Fetch all users or User details

  Future<UserModel?> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    if (snapshot.docs.isNotEmpty) {
      final userData =
          snapshot.docs.map((e) => UserModel.fromSnapShot(e)).single;
      return userData;
    } else {
      return null; // Tidak ada dokumen yang ditemukan
    }
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }
}
