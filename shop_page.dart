import 'package:flutter/material.dart';
import 'package:my_ex_app/components/my_drawer.dart';
import 'package:my_ex_app/components/my_product_tile.dart';
import 'package:my_ex_app/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {

    //access the product in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Shop Page"),
          actions: [
            IconButton(onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: const Icon(Icons.shopping_cart),
    ),
          ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          const SizedBox(height: 25),
          Center(child: Text("Pick From A Selected List Of Premium Products",
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          ),


          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final product = products[index];

                return MyProductTile(product: product);
              },
            ),
          )
        ],
      ),
    );
  }
}
