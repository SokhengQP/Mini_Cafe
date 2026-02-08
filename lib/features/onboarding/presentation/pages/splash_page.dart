import 'package:flutter/material.dart';
import '../../../../shared/layout/app_scaffold.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Column(
              children: const [
                Icon(Icons.coffee, size: 120, color: Colors.brown),
                SizedBox(height: 20),
                Text(
                  "CoffeeScript",
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
