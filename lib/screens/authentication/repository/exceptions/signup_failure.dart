import 'package:flutter/material.dart';

class SignUpfailure {
  final String message;

  const SignUpfailure([this.message = "An Unkown error Occurred"]);

  factory SignUpfailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignUpfailure('Please enter a strongger password.');
      case 'invalid-email':
        return SignUpfailure('Email is not valid or badly formatted.');
      case 'email-already-in-use':
        return SignUpfailure('An Account already exists for that email.');
      case 'operations-not-allowed':
        return SignUpfailure(
            'Operation is not allowed. Please contact support.');
      case 'user-disabled':
        return SignUpfailure(
            'This user has been disabled. Please contact support.');
      default:
        return SignUpfailure();
    }
  }
}
