import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/models/shop.dart';
import 'package:ecommerceapp/widgets/my_button.dart';
import 'package:ecommerceapp/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  void removeItemItemFromCart(BuildContext context,Product product){

    // remove item form the cart button method

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Remove this item from your cart?"),
          actions: [
            // Cancle Button
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancle"),
            ),
            // Yes Button
            MaterialButton(
              onPressed: () {
                //pop dialog box
                Navigator.pop(context);
                Provider.of<Shop>(context,listen: false).removeToCart(product);
              },
              child: Text("Yes"),
            ),
          ],
        ));
  }

  // pay now button method ......

  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: Text("User wnat to pay!"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final shopProviderCart = Provider.of<Shop>(context).cart;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // cart list
          Expanded(
              child: shopProviderCart.isEmpty ? Center(child: Text("Your cart is empty...",style: TextStyle(fontSize: 16.0),)) : ListView.builder(
                itemCount: shopProviderCart.length,
                  itemBuilder: (context , index) {
                final cartItem = shopProviderCart[index];
                return ListTile(
                  title: Text(cartItem.name),
                  subtitle: Text(cartItem.price.toString()),
                  trailing: Icon(Icons.remove),
                  onTap: () => removeItemItemFromCart(context,cartItem),
                );
              })
          ),
          // pay button here .....
          shopProviderCart.isEmpty ? SizedBox(height: 10,) : Padding(
            padding: const EdgeInsets.all(40.0),
            child: MyButton(onTap: () => payButtonPressed(context), child: Text("Pay Now")),
          )
        ],
      ),
      // drawer: const MyDrawer(),
    );
  }
}
