import 'package:flutter/material.dart';

import '../widgets/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> products = [];
  List<dynamic>cartItems=[];

  @override
  void initState() {
    super.initState();
    fetchProducts().then((data) {
      setState(() {
        products = data;
      });
    });
  }

  void addToCart(dynamic product) {
    setState(() {
      cartItems.add(product);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('E-Commerce App'),
        ),
        body:Material(
          child:ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              dynamic product = products[index];
              return ListTile(
                title: Text(product['title']),
                subtitle: Text('\$${product['price']}'),
                trailing: ElevatedButton(
                  onPressed: () => addToCart(product),
                  child: Text('Add to Cart'),
                ),
              );
            },
          ),
        )
    );
  }
}