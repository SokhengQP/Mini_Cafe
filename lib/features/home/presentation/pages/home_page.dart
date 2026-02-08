import 'package:flutter/material.dart';
import 'package:cafe_cool/shared/widgets/coffee_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Good Morning ☕",
                style: TextStyle(
                  // color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: const [
                    CoffeeCard(name: "Arabica", price: "18"),
                    CoffeeCard(name: "Robusta", price: "20"),
                    CoffeeCard(name: "Excelsa", price: "15"),
                    CoffeeCard(name: "Liberica", price: "12"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
