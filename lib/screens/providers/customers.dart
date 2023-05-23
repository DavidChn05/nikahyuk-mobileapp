import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../models/customer.dart';

class Customers with ChangeNotifier {
  List<Customer> _allCustomer = [];

  List<Customer> get allCustomer => _allCustomer;

  int get numOfCust => _allCustomer.length;

  Customer selectById(String id) =>
      _allCustomer.firstWhere((element) => element.id == id);

  addCustomer(String name, String email, String password) async {
    DateTime datetimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://httpreqproject-e0821-090-default-rtdb.firebaseio.com/customers.json");

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            "name": name,
            "email": email,
            "password": password,
            "createdAt": datetimeNow.toString(),
          },
        ),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        _allCustomer.add(
          Customer(
            id: json.decode(response.body)["name"].toString(),
            name: name,
            email: email,
            password: password,
            createdAt: datetimeNow,
          ),
        );

        notifyListeners();
      } else {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      throw (error);
    }
  }

  editCustomer(String id, String name, String email, String password) async {
    Uri url = Uri.parse(
        "https://httpreqproject-e0821-090-default-rtdb.firebaseio.com/customers/$id.json");
    try {
      final response = await http.patch(
        url,
        body: json.encode(
          {
            "name": name,
            "email": email,
            "password": password,
          },
        ),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        Customer selectPlayer =
            _allCustomer.firstWhere((element) => element.id == id);
        selectPlayer.name = name;
        selectPlayer.email = email;
        selectPlayer.password = password;
        notifyListeners();
      } else {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      throw (error);
    }
  }

  deleteCustomer(String id) async {
    Uri url = Uri.parse(
        "https://httpreqproject-e0821-090-default-rtdb.firebaseio.com/customers/$id.json");

    try {
      final response = await http.delete(url).then(
        (response) {
          _allCustomer.removeWhere((element) => element.id == id);
          notifyListeners();
        },
      );

      if (response.statusCode < 200 && response.statusCode >= 300) {
        throw ("${response.statusCode}");
      }
    } catch (error) {
      throw (error);
    }
  }
}
