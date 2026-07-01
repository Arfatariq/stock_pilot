import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stock_pilot/controllers/order_controllers.dart';
import 'package:stock_pilot/theme/app_colors.dart';
import 'package:stock_pilot/views/orders/add_orders_screen.dart';

import 'package:stock_pilot/widgets/order_cards.dart';
import 'package:stock_pilot/widgets/search_bar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordercontroller = Get.put(OrderController());

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddOrdersScreen(),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const AppSearchBar(hint: 'Search orders...'),

            const SizedBox(height: 14),

            // order count
            Obx(() {
              return Text(
                '${ordercontroller.orders.length} orders',
                style: TextStyle(
                    fontSize: 12, color: AppColors.primaryMid),
              );
            }),

            const SizedBox(height: 10),

            // orders list
            Expanded(
              child: Obx(() {

                // loading state
                if (ordercontroller.isloading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                }

                // empty state
                if (ordercontroller.orders.isEmpty) {
                  return Center(
                    child: Text(
                      'No orders yet\nTap + to add one',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13, color: Colors.grey.shade400),
                    ),
                  );
                }

                // orders list with pull to refresh
                return RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () => ordercontroller.fetchOrders(),
                  child: ListView.separated(
                    itemCount: ordercontroller.orders.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return OrderCard(
                        order: ordercontroller.orders[index],
                      );
                    },
                  ),
                );

              }),
            ),

          ],
        ),
      ),
    );
  }
}