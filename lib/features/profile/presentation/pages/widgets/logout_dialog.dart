import 'package:flutter/material.dart';

Future<void> showLogoutDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);

              // TODO: Add real logout logic here
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Logged out")));
            },
            child: const Text("Logout"),
          ),
        ],
      );
    },
  );
}
