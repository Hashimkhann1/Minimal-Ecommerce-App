import 'package:ecommerceapp/view/shop_screen.dart';
import 'package:ecommerceapp/widgets/my_button.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            // logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25,),
            // subtitle
            Text("Ecom Shop",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),),
            // button
            const SizedBox(height: 6.0,),
            Text("Premium Quility Products",style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary
            ),),
            const SizedBox(height: 12.0,),
            MyButton(onTap: () => Navigator.pushNamed(context, '/shop_screen'),
                child: Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}
