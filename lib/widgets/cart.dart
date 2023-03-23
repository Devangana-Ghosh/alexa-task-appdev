import 'package:alexa_shopping/widgets/productInfo.dart';
import 'package:flutter/material.dart';


class CartPage extends StatelessWidget {
  final List<dynamic> cartItems;


  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (BuildContext context, int index) {
          dynamic product= cartItems[index];
          return ListTile(
            title: Text(product['title']),
            subtitle: Text('\$${product['price']}'),
          );
        },
      ),
    );
  }
}









