import 'package:cafe_cool/shared/widgets/favorite_card.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

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
          : Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
              child: Column(
                children: [
                  // 🔍 Search Bar
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        hintText: "Search favorite coffee",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ❤️ Favorite Grid
                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: favorites.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 0.55,
                          ),
                      itemBuilder: (context, index) {
                        return FavoriteCard(
                          name: favorites[index]["name"]!,
                          price: favorites[index]["price"]!,
                          imagePath: favorites[index]["imagePath"]!,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  // 💤 Empty State
  Widget _buildEmptyState() {
    return const Center(
      child: Text("No favorite coffee yet ☕", style: TextStyle(fontSize: 16)),
    );
  }
}
