import 'package:flutter/material.dart';

class CartItemTile extends StatelessWidget {
  final String name;
  final int price;
  final String image;
  final int quantity;

  const CartItemTile({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          /// Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, height: 60, width: 60, fit: BoxFit.cover),
          ),

          const SizedBox(width: 12),

          /// Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "\$$price",
                  style: const TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          /// Quantity Selector
          Row(
            children: [
              _qtyButton(Icons.remove),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  quantity.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              _qtyButton(Icons.add),
            ],
          ),
        ],
      ),
    );
  }

  Widget _qtyButton(IconData icon) {
    return Container(
      height: 26,
      width: 26,
      decoration: BoxDecoration(
        color: Colors.brown,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(icon, size: 16, color: Colors.white),
    );
  }
}
