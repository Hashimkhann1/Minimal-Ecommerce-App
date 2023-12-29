import 'package:ecommerceapp/models/product.dart';
import 'package:flutter/cupertino.dart';

class Shop with ChangeNotifier {
  // products for sale

  final List<Product> _shop = [
    Product(
        descripition: 'Item DDescripition is here , more description more writhing to descripition here. ............',
        // imagePath: imagePath,
        name: "Watch for Men",
        price: 99.99,
        imagePath: 'images/product1.png'
    ),
    Product(
        descripition: 'Item DDescripition is here ...',
        // imagePath: imagePath,
        name: "Blue Eco Shoes for Kids",
        price: 99.99,
        imagePath: 'images/product2.png'
    ),
    Product(
        descripition: 'Item DDescripition is here ...',
        // imagePath: imagePath,
        name: "Cotton Full Sleeves Hoodies",
      imagePath: 'images/product3.png',
        price: 99.99,
    ),
    Product(
        descripition: 'Item DDescripition is here ...',
        // imagePath: imagePath,
        name: "NY Baseball Cap",
        price: 99.99,
        imagePath: 'images/product4.png'
    ),
    Product(
        descripition: 'Item DDescripition is here ...',
        // imagePath: imagePath,
        name: "Jump Black Sport Series",
        price: 99.99,
        imagePath: 'images/product5.png'
    ),
    Product(
        descripition: 'Item DDescripition is here ...',
        // imagePath: imagePath,
        name: "Genuine Leather Men Belt",
        price: 99.99,
        imagePath: 'images/product6.png'
    ),
  ];
  // user cart
  List<Product> _cart = [];
  // get product list

  List<Product> get shop => _shop;

  // get user cart

  List<Product> get cart => _cart;

  // add item to cart

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart

  void removeToCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }

}
