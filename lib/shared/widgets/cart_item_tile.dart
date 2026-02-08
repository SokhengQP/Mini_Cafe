import 'package:flutter/material.dart';

class CartItemTile extends StatelessWidget {
  final String name;
  final int price;

  const CartItemTile({super.key, required this.name, required this.price});

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
          const Icon(Icons.coffee, color: Colors.white),

          const SizedBox(width: 10),

          Expanded(
            child: Text(name, style: const TextStyle(color: Colors.white)),
          ),

          /// Quantity Selector
          Row(
            children: [
              _qtyButton(Icons.remove),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("1", style: TextStyle(color: Colors.white)),
              ),
              _qtyButton(Icons.add),
            ],
          ),

          const SizedBox(width: 10),

          Text("\$$price", style: const TextStyle(color: Colors.white)),
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
