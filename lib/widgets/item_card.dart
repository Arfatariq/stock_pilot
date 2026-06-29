import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';

class StockItem extends StatelessWidget {
  final String name;
  final String units;
  final String status;
  final Color statusColor;
  final Color statusBg;
  final bool isLast;

  const StockItem({
    super.key,
    required this.name,
    required this.units,
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

              // product icon
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.inventory_2_outlined,
                  size: 18,
                  color: Colors.grey.shade400,
                ),
              ),

              const SizedBox(width: 12),

              // name and units
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      units,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),

              // status badge
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
        ),

        // divider after every item except the last one
        if (isLast == false)
          Divider(height: 1, color: Colors.grey.shade100),

      ],
    );
  }
}