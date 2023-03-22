import 'package:alexa_shopping/widgets/productInfo.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}

class Cart {
  final List<CartItem> items = [];

  void addItem(Product product) {
    final cartItemIndex = items.indexWhere((item) => item.product.id == product.id);

    if (cartItemIndex >= 0) {
      items[cartItemIndex].quantity++;
    } else {
      items.add(CartItem(product: product));
    }
  }
}






