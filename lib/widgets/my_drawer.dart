import 'package:ecommerceapp/widgets/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(child: Icon(Icons.shopping_bag,size: 70,color: Theme.of(context).colorScheme.inversePrimary,)),
              const SizedBox(height: 25,),
              // shop tile
              MyListTile(onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/shop_screen');
                }, icon: Icons.home, text: 'Shop'),
              MyListTile(onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context,'/cart_screen');
              }, icon: Icons.shopping_cart, text: 'Cart'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(onTap: () {
              Navigator.pushNamed(context, '/intro_screen');
            }, icon: Icons.logout, text: 'Exit'),
          )
          // cart tile

          // exit shop tile
        ],
      ),
    );
  }
}
