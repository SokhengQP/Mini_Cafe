import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy Policy")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            "Your privacy is important to us.\n\n"
            "This is a demo privacy policy. Replace this with real content later.",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
