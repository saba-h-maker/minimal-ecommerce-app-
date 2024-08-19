import 'package:flutter/cupertino.dart';
import 'package:my_ex_app/models/product.dart';

class Shop extends ChangeNotifier{
  //product for sale
  final List<Product> _shop = [
    Product(
      name: "Product 1",
        price: 99.9,
        description: "item description..",
      imagePath: 'assets/male-watch-144648_1280.jpg',
  ),

    Product(
      name: "Product 2",
    price: 99.9,
    description: "item description..",
      imagePath: 'assets/handbag-2356179_1280.jpg',
  ),

    Product(
      name: "Product 3",
    price: 99.9,
    description: "item description..",
      imagePath: 'assets/oxford-shoes-6078993_1280.jpg',
    ),

    Product(
      name: "Product 4",
    price: 99.9,
    description: "item description..",
      imagePath: 'assets/woman-7092612_1280.jpg',
    ),

  ];

  //user cart
  List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //add user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }

}