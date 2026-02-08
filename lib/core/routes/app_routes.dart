import 'package:cafe_cool/features/orders/presentation/pages/order_success_screen.dart';
import 'package:cafe_cool/features/orders/presentation/pages/order_tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:cafe_cool/features/payment/presentation/pages/payment_screen.dart';

class AppRoutes {
  static const payment = "/payment";
  static const orderSuccess = "/order_success";
  static const orderTracking = "/order_tracking";
  static Map<String, WidgetBuilder> routes = {
    payment: (_) => const PaymentScreen(),
    orderSuccess: (_) => const OrderSuccessScreen(),
    orderTracking: (_) => const OrderTrackingScreen(),
  };
}
