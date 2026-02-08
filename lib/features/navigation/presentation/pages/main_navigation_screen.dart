import 'package:cafe_cool/features/cart/presentation/pages/cart_page.dart';
import 'package:cafe_cool/features/favorite/presentation/pages/favorite_page.dart';
import 'package:cafe_cool/features/home/presentation/pages/home_page.dart';
import 'package:cafe_cool/features/profile/presentation/pages/profile_page.dart';
import 'package:cafe_cool/shared/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int currentIndex = 0;

  final screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: screens[currentIndex],

      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
