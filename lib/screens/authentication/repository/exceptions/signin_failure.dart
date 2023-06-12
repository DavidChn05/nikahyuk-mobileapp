import 'package:firebase_auth/firebase_auth.dart';

class SignInFailure implements Exception {
  final String message;

  SignInFailure(this.message);

  factory SignInFailure.fromFirebaseException(FirebaseAuthException exception) {
    String message = 'An error occurred during sign up.';

    // Map Firebase error codes to custom error messages
    switch (exception.code) {
      case 'email-already-in-use':
        message = 'The email address is already in use by another account.';
        break;
      // Handle other Firebase error codes as needed
      case 'weak-password':
        message = 'Please enter a strongger password.';
        break;
      case 'invalid-email':
        message = 'Email is not valid or badly formatted.';
        break;
      case 'operations-not-allowed':
        message = 'Operation is not allowed. Please contact support.';
        break;
      case 'user-disabled':
        message = 'This user has been disabled. Please contact support.';
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        message = 'Wrong email/password combination.';
        break;
    }

    return SignInFailure(message);
  }

  @override
  String toString() {
    return 'SignInFailure: $message';
  }
}
