import 'package:flutter/material.dart';
import 'package:my_ex_app/components/my_buttons.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
                Icons.shopping_bag,
            size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),


            //title
            Text("Minimal Shop", style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20,

            ),
            ),

            const SizedBox(height: 10),


            //sutitile
            Text("Premium Quality Products", style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,

            ),
            ),

            const SizedBox(height: 25),
            //button
            MyButtons(onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: const Icon(Icons.arrow_forward))
          ],
        ),
      ),
    );
  }
}
