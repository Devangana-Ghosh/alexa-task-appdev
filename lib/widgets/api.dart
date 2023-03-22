import 'dart:convert';

import 'package:http/http.dart' as http;
//https://fakestoreapi.com/products
Future<List<dynamic>> fetchProducts() async {
  var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load products');
  }
}
