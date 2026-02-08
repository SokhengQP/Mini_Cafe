import 'package:cafe_cool/shared/widgets/cart_item_tile.dart';
import 'package:cafe_cool/shared/widgets/checkout_button.dart';
import 'package:cafe_cool/shared/widgets/summary_row.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Cart 🛒",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              /// CART ITEMS
              Expanded(
                child: ListView(
                  children: const [
                    CartItemTile(
                      name: "Arabica",
                      price: 18,
                      image: "assets/images/arabica.png",
                    ),
                    CartItemTile(
                      name: "Arabica",
                      price: 18,
                      image: "assets/images/arabica.png",
                    ),
                  ],
                ),
              ),

              /// ORDER SUMMARY
              Container(
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: const [
                    SummaryRow("Subtotal", "\$38"),
                    SummaryRow("Tax", "\$3"),
                    SummaryRow("Service Fee", "\$2"),
                    Divider(color: Colors.white),
                    SummaryRow("Total", "\$43", isTotal: true),
                    SizedBox(height: 12),
                    CheckoutButton(),
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
