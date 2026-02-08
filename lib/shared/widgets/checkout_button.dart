import 'package:cafe_cool/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.brown,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: () {
          Navigator.of(
            context,
            rootNavigator: true,
          ).pushNamed(AppRoutes.payment);
        },

        child: const Text("Checkout", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
