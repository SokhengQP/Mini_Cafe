import 'package:flutter/material.dart';
import 'package:cafe_cool/shared/widgets/coffee_card.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  // Demo favorite list (later this should come from state / database)
  final List<Map<String, String>> favorites = const [
    {"name": "Arabica", "price": "18", "imagePath": "assets/images/1.png"},
    {"name": "Robusta", "price": "20", "imagePath": "assets/images/2.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorites ❤️"), centerTitle: true),
      body: favorites.isEmpty
          ? _buildEmptyState()
          : GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
              physics: const BouncingScrollPhysics(),
              itemCount: favorites.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.50,
              ),
              itemBuilder: (context, index) {
                final coffee = favorites[index];

                return TweenAnimationBuilder(
                  duration: Duration(milliseconds: 400 + index * 100),
                  tween: Tween<double>(begin: 0, end: 1),
                  builder: (context, double value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Opacity(
                        opacity: value,
                        child: CoffeeCard(
                          name: coffee["name"]!,
                          price: coffee["price"]!,
                          imagePath: coffee["imagePath"],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.favorite_border, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            "No favorite coffee yet",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
