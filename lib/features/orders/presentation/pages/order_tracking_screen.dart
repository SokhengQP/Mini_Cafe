import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tracking Your Order")),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(Icons.delivery_dining, size: 120, color: Colors.brown),

            const SizedBox(height: 20),

            const Text(
              "Your coffee is on the way ☕",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Estimated delivery: 15 minutes",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            _trackingStep("Order Received", true),
            _trackingStep("Preparing Coffee", true),
            _trackingStep("Out for Delivery", false),
            _trackingStep("Delivered", false),

            const Spacer(), // ⭐ pushes buttons to bottom
            /// TWO BUTTONS
            Row(
              children: [
                /// REFUND BUTTON (LEFT)
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Refund"),
                  ),
                ),

                const SizedBox(width: 12),

                /// RECEIVED BUTTON (RIGHT)
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                    ),
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: const Text(
                      "Another Order?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _trackingStep(String title, bool completed) {
    return ListTile(
      leading: Icon(
        completed ? Icons.check_circle : Icons.radio_button_unchecked,
        color: completed ? Colors.green : Colors.grey,
      ),
      title: Text(title),
    );
  }
}
