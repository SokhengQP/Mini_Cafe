import 'package:flutter/material.dart';

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Invite Friends")),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.share),
          label: const Text("Share Invite Link"),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Invite link shared!")),
            );
          },
        ),
      ),
    );
  }
}
