import 'package:flutter/material.dart';
import 'package:my_ex_app/models/product.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key,
  required this.product,
  });

  //add to cart button Pressed

  void addToCart(BuildContext context) {
    // show a dialogue bix to ask to confirm to add to cart
    showDialog(context: context, builder: (context) => AlertDialog(
      content: const Text("Add This Item To Your Cart?"),
      actions: [
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),

        MaterialButton(
         onPressed: () {
           Navigator.pop(context);

           context.read<Shop>().addToCart(product);
         },
          child: Text("Yes"),
    ),

      ],
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Column(
           children: [
             //product image
             AspectRatio (
               aspectRatio: 1,
               child: Container(
                 decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
                   borderRadius: BorderRadius.circular(12),
                 ),
                 width: double.infinity,
                 padding: const EdgeInsets.all(25),
                 child: Image.asset(product.imagePath),
               ),
             ),

             const SizedBox(height: 25),
             //product name
             Text(
               product.name,
               style: const TextStyle(fontWeight: FontWeight.bold,
                 fontSize: 20,
               ),
             ),

             const SizedBox(height: 10),
             //product description
             Text(product.description, style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
             ),
             ),


             const SizedBox(height: 10),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('\$' + product.price.toStringAsFixed(2)),

                 Container(
                   decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
                     borderRadius: BorderRadius.circular(12),
                   ),
                   child: IconButton(
                       onPressed: () => addToCart(context),
                       icon: const Icon(Icons.add),
                   ),
                 ),
               ],
             ),
           ],
         ),
        ],
      ),
    );
  }
}
