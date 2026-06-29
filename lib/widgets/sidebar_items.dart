import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';

class SidebarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const SidebarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: selected ? Colors.white : AppColors.primary,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.white : AppColors.primary,
        ),
      ),
      tileColor: selected
          ? AppColors.primary.withOpacity(0.2)
          : Colors.transparent,
      onTap: onTap,
    );
  }
}

