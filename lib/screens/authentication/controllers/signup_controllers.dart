import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahyuk/screens/authentication/repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //textfield Controllers to get data form textfield
  final email = TextEditingController();
  final password = TextEditingController();
  final fullname = TextEditingController();

  //call this funciton from Design & it will do the rest
  void registerUser(String email, String password) {
    AuthenticationRepository.intance
        .createUserWithEmailAndPassword(email, password);
  }

  // Fungsi untuk memeriksa apakah email valid
  bool isEmailValid(String email) {
    // Lakukan validasi email sesuai dengan kebutuhanmu
    // Contoh validasi sederhana menggunakan regex
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
