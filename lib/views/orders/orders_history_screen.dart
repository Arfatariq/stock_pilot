import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';
import 'package:stock_pilot/views/orders/add_orders_screen.dart';

class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
        floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddOrdersScreen(),
            ),
          );
        },
    ));
  }
}