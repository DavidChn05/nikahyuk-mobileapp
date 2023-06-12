import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahyuk/screens/authentication/repository/authentication_repository.dart';

import '../../login_success/loginsuccess_screen.dart';
import '../../sign_up/signup_screen.dart';
import '../repository/exceptions/signup_failure.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await AuthenticationRepository.instance
          .createUserWithEmailAndPassword(email, password);
      if (AuthenticationRepository.instance.firebaseUser.value != null) {
        Get.offAll(() => LoginSuccessScreen());
      } else {
        Get.offAll(() => SignUpScreen());
      }
    } on SignUpFailure catch (e) {}
  }
}
