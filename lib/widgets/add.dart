import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:alexa_shopping/widgets/productInfo.dart';
import 'package:flutter/material.dart';

import 'cart.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final Cart _cart = Cart();
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  void _fetchProducts() async {
    final response = await http.get(
        Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        _products = data.map((json) =>
            Product(
              id: json['id'],
              title: json['title'],
              price: json['price'].toDouble(),
              description: json['description'],
              category: json['category'],
              image: json['image'],
            )).toList();
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  void _addToCart(Product product) {
    setState(() {
      _cart.addItem(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
    );
  }
}