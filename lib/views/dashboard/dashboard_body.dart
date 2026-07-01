import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';
import 'package:stock_pilot/widgets/item_card.dart';
import 'package:stock_pilot/widgets/order_items.dart';
import 'package:stock_pilot/widgets/product_stat_cards.dart';


class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 4),

          // welcome text
          const Text(
            'Welcome back ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Here\'s what\'s going on today',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
          ),

          const SizedBox(height: 20),

          // overview label
          const Text(
            'Overview',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 12),

          // stat cards row 1
          Row(
            children: [
              Expanded(
                child: ProductStatCards(
                  label: 'Total products',
                  value: '142',
                  icon: Icons.inventory_2_outlined,
                  iconColor: AppColors.primary,
                  bgColor: AppColors.primaryLight,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ProductStatCards(
                  label: 'Suppliers',
                  value: '24',
                  icon: Icons.store_outlined,
                  iconColor: AppColors.primaryDark,
                  bgColor: AppColors.primaryLight,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // stat cards row 2
          Row(
            children: [
              Expanded(
                child: ProductStatCards(
                  label: 'Open orders',
                  value: '7',
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.primary,
                  bgColor: AppColors.primaryLight,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ProductStatCards(
                  label: 'Low stock',
                  value: '5',
                  icon: Icons.warning_amber_outlined,
                  iconColor: AppColors.primaryMid,
                  bgColor: AppColors.primaryDark,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // recent orders label
          const Text(
            'Recent purchase orders',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 12),

          // orders list container
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              children: [
                OrderItem(
                  orderId: 'PO-2024-041',
                  supplier: 'TechParts Ltd',
                  items: '12 items',
                  amount: 'Rs. 45,200',
                  status: 'Received',
                  statusColor: const Color(0xFF3B6D11),
                  statusBg: const Color(0xFFEAF3DE),
                  isLast: false,
                ),
                OrderItem(
                  orderId: 'PO-2024-040',
                  supplier: 'Apex Supplies',
                  items: '6 items',
                  amount: 'Rs. 18,750',
                  status: 'Pending',
                  statusColor: AppColors.primaryDark,
                  statusBg: AppColors.primaryMid,
                  isLast: false,
                ),
                OrderItem(
                  orderId: 'PO-2024-039',
                  supplier: 'GlobalStock',
                  items: '20 items',
                  amount: 'Rs. 92,000',
                  status: 'Ordered',
                  statusColor: AppColors.primary,
                  statusBg: AppColors.primaryLight,
                  isLast: true,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // low stock label
          const Text(
            'Low stock alerts',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryDark,
            ),
          ),
          const SizedBox(height: 12),

          // stock list container
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              children: [
                StockItem(
                  name: 'USB-C Hub 7-in-1',
                  units: '3 units left',
                  status: 'Critical',
                  statusColor: const Color(0xFFA32D2D),
                  statusBg: const Color(0xFFFCEBEB),
                  isLast: false,
                ),
                StockItem(
                  name: 'Wireless Mouse Pro',
                  units: '7 units left',
                  status: 'Low',
                  statusColor: AppColors.primaryDark,
                  statusBg: AppColors.primaryMid,
                  isLast: false,
                ),
                StockItem(
                  name: 'HDMI Cable 2m',
                  units: '10 units left',
                  status: 'Low',
                  statusColor: AppColors.primaryDark,
                  statusBg: AppColors.primaryLight,
                  isLast: true,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

        ],
      ),
    );
  }
}