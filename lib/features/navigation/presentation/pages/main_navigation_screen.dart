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
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final screens = const [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBody: true, // This makes the body extend behind the bottom nav

      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe
        children: screens,
      ),

      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
