import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nikahyuk/screens/authentication/repository/exceptions/signin_failure.dart';
import 'package:nikahyuk/screens/authentication/repository/exceptions/signup_failure.dart';
import 'package:nikahyuk/screens/home_page/homepage.dart';
import 'package:nikahyuk/screens/login_success/loginsuccess_screen.dart';
import 'package:nikahyuk/screens/sign_in/signin_screen.dart';
import 'package:nikahyuk/screens/sign_up/signup_screen.dart';
import 'package:nikahyuk/screens/splash/splashscreen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance =>
      Get.find<AuthenticationRepository>();

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => splashScreen())
        : Get.offAll(() => HomePageScreen());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String fullName) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => LoginSuccessScreen())
          : Get.offAll(() => SignUpScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpFailure.fromFirebaseException(e);
      print("FIREBASE AUTH EXCEPTION - ${ex.message}");
      Get.snackbar(
        'Sign Up Failed',
        ex.message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      ); // Optional: rethrow the exception to propagate it further
    } catch (_) {
      final ex = SignUpFailure('An unknown error occurred.');
      print("EXCEPTION - ${ex.message}");
      Get.snackbar(
        'Sign Up Failed',
        ex.message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      throw ex; // Optional: rethrow the exception to propagate it further
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => LoginSuccessScreen())
          : Get.offAll(() => SignInScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignInFailure.fromFirebaseException(e);
      print("FIREBASE AUTH EXCEPTION - ${ex.message}");
      Get.snackbar(
        'Sign In Failed',
        ex.message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      throw ex; // Optional: rethrow the exception to propagate it further
    } catch (_) {
      final ex = SignInFailure('An unknown error occurred.');
      print("EXCEPTION - ${ex.message}");
      Get.snackbar(
        'Sign In Failed',
        ex.message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      throw ex; // Optional: rethrow the exception to propagate it further
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
