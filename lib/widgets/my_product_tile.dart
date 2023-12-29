import 'package:ecommerceapp/models/product.dart';
import 'package:ecommerceapp/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  MyProductTile({
    super.key,
    required this.product,
  });

  void addToCart(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text("Add item to your cart?"),
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
                  Provider.of<Shop>(context,listen: false).addToCart(product);
                },
              child: Text("Yes"),
            ),
          ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12,),
                    ),
                    padding: EdgeInsets.all(25),
                    child: Image.asset(product.imagePath.toString())
                ),

              ),
              const SizedBox(height: 25),
              //Product name
              Text(product.name.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              const SizedBox(height: 10),
              // product descripition
              Text(product.descripition.toString(),style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
              const SizedBox(height: 25),
            ],
          ),
          // Product proce + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$"+product.price.toStringAsFixed(2)),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)
                ),
                  child: IconButton(onPressed: () => addToCart(context), icon: Icon(Icons.add)
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}
