import 'package:cafe_cool/features/profile/presentation/pages/widgets/invite_friends_screen.dart';
import 'package:cafe_cool/features/profile/presentation/pages/widgets/logout_dialog.dart';
import 'package:cafe_cool/features/profile/presentation/pages/widgets/my_orders_screen.dart';
import 'package:cafe_cool/features/profile/presentation/pages/widgets/privacy_policy_screen.dart';
import 'package:cafe_cool/features/profile/presentation/pages/widgets/settings_screen.dart';
import 'package:cafe_cool/shared/widgets/profile_menu_tile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              /// Profile Header
              Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.brown,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "Coffee Lover ☕",
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "coffee@app.com",
                    // style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// Profile Menu List
              Expanded(
                child: ListView(
                  children: [
                    ProfileMenuTile(
                      icon: Icons.shopping_bag,
                      title: "My Orders",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MyOrdersScreen(),
                          ),
                        );
                      },
                    ),

                    ProfileMenuTile(
                      icon: Icons.settings,
                      title: "Settings",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),
                    ProfileMenuTile(
                      icon: Icons.lock,
                      title: "Privacy Policy",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PrivacyPolicyScreen(),
                          ),
                        );
                      },
                    ),
                    ProfileMenuTile(
                      icon: Icons.group,
                      title: "Invite Friends",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const InviteFriendsScreen(),
                          ),
                        );
                      },
                    ),
                    ProfileMenuTile(
                      icon: Icons.logout,
                      title: "Logout",
                      isLogout: true,
                      onTap: () {
                        showLogoutDialog(context);
                      },
                    ),
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
