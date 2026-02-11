import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  List<Map<String, dynamic>> favoriteCoffees = [
    {
      "id": "1",
      "name": "Arabica",
      "price": "18",
      "rating": "4.8",
      "imageUrl":
          "https://images.unsplash.com/photo-1511920170033-f8396924c348?w=400",
    },
    {
      "id": "2",
      "name": "Robusta",
      "price": "20",
      "rating": "4.9",
      "imageUrl":
          "https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=400",
    },
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // -----------------------
  // REMOVE FAVORITE + UNDO
  // -----------------------
  void removeFavorite(int index) {
    final removedItem = favoriteCoffees[index];

    setState(() {
      favoriteCoffees.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${removedItem['name']} removed"),
        backgroundColor: Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: "Undo",
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              favoriteCoffees.insert(index, removedItem);
            });
          },
        ),
      ),
    );
  }

  // -----------------------
  // UI BUILD
  // -----------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF1a1a2e),
              const Color(0xFF16213e),
              Colors.brown.shade900,
            ],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: favoriteCoffees.isEmpty
                      ? _buildEmptyState()
                      : _buildFavoritesGrid(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // -----------------------
  // HEADER
  // -----------------------
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "My Favorites ❤️",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${favoriteCoffees.length} saved",
            style: TextStyle(color: Colors.orange.shade300),
          ),
        ],
      ),
    );
  }

  // -----------------------
  // FAVORITES GRID
  // -----------------------
  Widget _buildFavoritesGrid() {
    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
      physics: const BouncingScrollPhysics(),
      itemCount: favoriteCoffees.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.70,
      ),
      itemBuilder: (context, index) {
        final coffee = favoriteCoffees[index];

        return Dismissible(
          key: ValueKey(coffee['id']),
          direction: DismissDirection.endToStart,

          onDismissed: (_) => removeFavorite(index),

          background: Container(
            decoration: BoxDecoration(
              color: Colors.red.shade700,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),

          child: TweenAnimationBuilder(
            duration: Duration(milliseconds: 300 + index * 80),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (_, double value, __) {
              return Transform.scale(
                scale: value,
                child: Opacity(
                  opacity: value,
                  child: _buildFavoriteCard(coffee),
                ),
              );
            },
          ),
        );
      },
    );
  }

  // -----------------------
  // FAVORITE CARD (SAFE)
  // -----------------------
  Widget _buildFavoriteCard(Map<String, dynamic> coffee) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.brown.shade800.withOpacity(0.5),
            Colors.brown.shade900.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          /// IMAGE
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.network(
                coffee['imageUrl'],
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// DETAILS (Overflow Safe)
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffee['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Row(
                  children: [
                    Icon(Icons.star, size: 14, color: Colors.orange.shade300),
                    const SizedBox(width: 4),
                    Text(
                      coffee['rating'],
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${coffee['price']}",
                      style: TextStyle(
                        color: Colors.orange.shade300,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.orange.shade700,
                            Colors.orange.shade900,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // -----------------------
  // EMPTY STATE
  // -----------------------
  Widget _buildEmptyState() {
    return Center(
      child: Text(
        "No favorites yet ☕",
        style: TextStyle(color: Colors.orange.shade300, fontSize: 18),
      ),
    );
  }
}
