import 'package:flutter/material.dart';
import 'package:my_ex_app/components/my_buttons.dart';
import 'package:my_ex_app/models/product.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //removed item from cart method

  void removeItemFromCart(BuildContext context, Product product ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
      content: const Text("remove This Item To Your Cart?"),
      actions: [
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),

        MaterialButton(
          onPressed: () {
            Navigator.pop(context);

            context.read<Shop>().removeFromCart(product);
          },
          child: Text("Yes"),
        ),

      ],
    ),
    );
  }

  //user presses pay button

  void payButtonPressed(BuildContext context) {
    showDialog(context: context, builder: (context) => const AlertDialog(
      content: Text("User Want To Pay! Connect this APP your payment backend"),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final Cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart"),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Expanded(
              child: Cart.isEmpty
                  ? const Center(child:  Text("Your Cart Is Empty.."))
                  : ListView.builder(
                itemCount: Cart.length,
                itemBuilder: (context, index) {
                final item = Cart[index];

                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => removeItemFromCart(context, item),
                  ),
                );
              },
              ),
          ),

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButtons(onTap: () => payButtonPressed(context), child: Text("PAY NOW")),
          )
        ],
      ),
    );
  }
}
