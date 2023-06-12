import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:nikahyuk/models/user_model.dart';
import 'package:nikahyuk/screens/authentication/repository/exceptions/signup_failure.dart';
import 'package:nikahyuk/screens/authentication/repository/user_repository/user_repository.dart';

import '../../login_success/loginsuccess_screen.dart';
import '../../sign_up/signup_screen.dart';
import '../repository/exceptions/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final userRepo = Get.put(UserRepository());

  // call funciton from design & they will do the logic
  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    registerUser(user.email, user.password);
    Get.to(() => const LoginSuccessScreen());
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
