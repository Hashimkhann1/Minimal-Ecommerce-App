import 'package:ecommerceapp/models/shop.dart';
import 'package:ecommerceapp/widgets/my_drawer.dart';
import 'package:ecommerceapp/widgets/my_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shopProvider = Provider.of<Shop>(context).shop;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.grey.shade600,
          title: Text("Shop"),
          centerTitle: true,
          actions: [
            Consumer<Shop>(builder: (context , value , child) {
              return Stack(
                children: [
                  IconButton(
                      onPressed: () => Navigator.pushNamed(context, '/cart_screen'),
                      icon: Icon(Icons.shopping_cart_outlined,size: 30,)),
                  value.cart.isEmpty ? SizedBox() : Positioned(
                    right: 12,
                    bottom: 40,
                    child: Container(
                      alignment: Alignment.center,
                      width: 16.0,
                      height:16.0,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(value.cart.length.toString(),style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              );
            })
          ],
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: [
            SizedBox(
              height: 25.0,
            ),
            // shop subtitle
            Center(
                child: Text(
              "Pick from a selected list of premium products",
              style: TextStyle(
                  color: Colors.grey.shade500, fontWeight: FontWeight.bold),
            )),
            // return product list
            SizedBox(
              height: 550,
              child: ListView.builder(
                  itemCount: shopProvider.length,
                  padding: const EdgeInsets.all(15.0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final productIndex = shopProvider[index];
                    return MyProductTile(product: productIndex);
                  }),
            ),
          ],
        ));
  }
}
