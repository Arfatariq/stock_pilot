import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';

class OrderItem extends StatelessWidget {
  final String orderId;
  final String supplier;
  final String items;
  final String amount;
  final String status;
  final Color statusColor;
  final Color statusBg;
  final bool isLast;

  const OrderItem({
    super.key,
    required this.orderId,
    required this.supplier,
    required this.items,
    required this.amount,
    required this.status,
    required this.statusColor,
    required this.statusBg,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            children: [

              // left — order id and supplier
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderId,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '$supplier · $items',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),

              // right — amount and status badge
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    amount,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: statusBg,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontSize: 11,
                        color: statusColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),

        // divider after every item except the last one
        if (isLast == false)
          Divider(height: 1, color: Colors.grey.shade100),

      ],
    );
  }
}