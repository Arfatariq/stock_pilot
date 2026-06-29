import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';

class SidebarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const SidebarItem({
    super.key,
    required this.icon,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary.withOpacity(0.25)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [

            // icon
            Icon(
              icon,
              size: 20,
              color: selected ? Colors.white : AppColors.primaryMid,
            ),

            const SizedBox(width: 12),

            // title
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                color: selected ? Colors.white : AppColors.primaryMid,
                fontWeight:
                    selected ? FontWeight.w500 : FontWeight.normal,
              ),
            ),

          ],
        ),
      ),
    );
  }
}