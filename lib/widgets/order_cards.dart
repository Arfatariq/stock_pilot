import 'package:flutter/material.dart';
import 'package:stock_pilot/models/order_model.dart';
import 'package:stock_pilot/theme/app_colors.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({
    super.key,
    required this.order,
  });

  // status badge color
  Color getStatusColor(String status) {
    if (status == 'Delivered') return const Color(0xFF3B6D11);
    if (status == 'Pending') return AppColors.primaryDark;
    return AppColors.primary;
  }

  Color getStatusBg(String status) {
    if (status == 'Delivered') return const Color(0xFFEAF3DE);
    if (status == 'Pending') return AppColors.primaryLight;
    return AppColors.primaryLight;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [

          // order icon box
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.shopping_cart_outlined,
              size: 22,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(width: 12),

          // order details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.productName,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryDark,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  order.supplier,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'Rs. ${order.price.toStringAsFixed(0)} · ${order.quantity} qty',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),

          // status badge
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: getStatusBg(order.status),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              order.status,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: getStatusColor(order.status),
              ),
            ),
          ),

        ],
      ),
    );
  }
}