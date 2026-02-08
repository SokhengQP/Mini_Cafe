import 'package:cafe_cool/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../../../../shared/layout/app_scaffold.dart';
import '../../../../shared/widgets/app_button.dart';
import '../../../../shared/widgets/app_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              "Welcome to Login",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 30),
            const AppTextField(hint: "E-mail Address"),
            const SizedBox(height: 20),
            const AppTextField(hint: "Password"),
            const SizedBox(height: 30),

            /// ✅ LOGIN BUTTON
            AppButton(
              title: "Sign In",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
