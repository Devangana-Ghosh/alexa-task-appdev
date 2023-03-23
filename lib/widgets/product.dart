import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:alexa_shopping/widgets/product.dart';
import 'package:flutter/material.dart';

import 'api.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<dynamic> cartItems;

  CartPage({Key? key, required this.cartItems}) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: widget.cartItems.isEmpty
          ? Center(child: Text('Your Cart is Empty'))
          : ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          dynamic product = widget.cartItems[index];
          return ListTile(
            title: Text(product['title']),
            subtitle: Text('\$${product['price']}'),
          );
        },
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<dynamic> products = [];
  List<dynamic> cartItems=[];

  Future<void> _getProducts() async {
    try {
      final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode == 200) {
        setState(() {
          products = jsonDecode(response.body);
        });
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
    }
  }

  void addToCart(dynamic product) {
    setState(() {
      cartItems.add(product);
    });
  }

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          dynamic product = products[index];
          return ListTile(
            title: Text(product['title']),
            subtitle: Text('\$${product['price']}'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                addToCart(product);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage(cartItems: cartItems)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
