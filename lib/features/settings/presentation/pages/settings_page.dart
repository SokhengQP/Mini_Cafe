import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        children: [
          /// Account
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text("Account", style: TextStyle(fontSize: 18)),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text("Change Password"),
            onTap: () {},
          ),

          /// Preferences
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text("Preferences", style: TextStyle(fontSize: 18)),
          ),
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: false,
            onChanged: (value) {},
          ),

          /// Support
          const Padding(padding: EdgeInsets.all(16), child: Text("Support")),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About"),
            onTap: () {},
          ),

          /// Logout
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("Logout"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
