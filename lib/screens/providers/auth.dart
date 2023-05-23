import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Authentication with ChangeNotifier {
  Future<void> signup(String? email, String? password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCNz6F4zqMmMWZ0Xw1zVjKSBr4X1Iw94DI");

    try {
      var response = await http.post(
        url,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      );

      var responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw responseData['error']["message"];
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> login(String? email, String? password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCNz6F4zqMmMWZ0Xw1zVjKSBr4X1Iw94DI");

    try {
      var response = await http.post(
        url,
        body: json.encode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
      );

      var responseData = json.decode(response.body);

      if (responseData['error'] != null) {
        throw responseData['error']["message"];
      }
    } catch (error) {
      rethrow;
    }
  }
}
