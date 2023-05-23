import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:nikahyuk/models/carts.dart';

class Repository {
  final _baseUrl = 'https://mockapi.io/projects/646b53ab7d3c1cae4ce3a0e5';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Cart> products = it.map((e) => Cart.fromJson(e)).toList();
        return products;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
