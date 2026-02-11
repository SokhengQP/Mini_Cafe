import 'package:flutter/material.dart';
import 'package:cafe_cool/shared/widgets/coffee_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  String selectedCategory = 'All';

  final List<String> categories = ['All', 'Hot', 'Iced', 'Special'];

  final List<Map<String, String>> coffees = [
    {"name": "Arabica", "price": "18", "imagePath": "assets/images/1.png"},
    {"name": "Robusta", "price": "20", "imagePath": "assets/images/2.png"},
    {"name": "Excelsa", "price": "15", "imagePath": "assets/images/3.png"},
    {"name": "Liberica", "price": "12", "imagePath": "assets/images/4.png"},
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Good Morning ☕",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                _buildCategories(),

                const SizedBox(height: 20),

                Expanded(child: _buildCoffeeGrid()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- Categories ----------------

  Widget _buildCategories() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategory == category;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = category;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              decoration: BoxDecoration(
                gradient: isSelected
                    ? LinearGradient(
                        colors: [
                          Colors.orange.shade700,
                          Colors.orange.shade900,
                        ],
                      )
                    : null,
                color: isSelected ? null : Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: isSelected
                      ? Colors.orange.shade600
                      : Colors.white.withOpacity(0.2),
                ),
              ),
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ---------------- Coffee Grid ----------------

  Widget _buildCoffeeGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.55,
      ),
      itemCount: coffees.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return TweenAnimationBuilder(
          duration: Duration(milliseconds: 400 + (index * 100)),
          tween: Tween<double>(begin: 0, end: 1),
          builder: (context, double value, child) {
            return Transform.translate(
              offset: Offset(0, 50 * (1 - value)),
              child: Opacity(
                opacity: value,
                child: CoffeeCard(
                  name: coffees[index]["name"]!,
                  price: coffees[index]["price"]!,
                  imagePath: coffees[index]["imagePath"]!,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
