import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  final String name;
  final String price;

  const FavoriteCard({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF7B5A4A),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Heart Icon
          const Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.favorite, color: Colors.red, size: 22),
          ),

          const Spacer(),

          /// Coffee Icon
          const Center(
            child: Icon(Icons.coffee, size: 46, color: Colors.white),
          ),

          const Spacer(),

          /// Name
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),

          // const SizedBox(height: 4),

          /// Price
          Text(
            "\$$price",
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
