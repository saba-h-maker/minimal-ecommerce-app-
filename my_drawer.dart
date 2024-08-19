import 'package:flutter/material.dart';
import 'package:my_ex_app/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key,});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //drawer header: logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.shopping_bag,
                        size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
                        ),
            ),
          ),
          const SizedBox(height: 25),
          //shop title
          MyListTile(text: "shop",
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
          ),

          //cart title
          MyListTile(text: "Cart",
            icon: Icons.shopping_cart,
            onTap: () {
            //pop drawer first
            Navigator.pop(context);
            //go to cart page
              Navigator.pushNamed(context, '/cart_page');
            },
          ),

          //exit shop title
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyListTile(text: "Exit",
              icon: Icons.exit_to_app,
              onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
