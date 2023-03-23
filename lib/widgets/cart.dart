import 'package:alexa_shopping/widgets/productInfo.dart';
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

