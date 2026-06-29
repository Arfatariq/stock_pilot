import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';
import 'package:stock_pilot/widgets/app_logo.dart';
import 'package:stock_pilot/widgets/sidebar_items.dart';
import 'package:stock_pilot/widgets/top_bar.dart';

class DashboardSidebar extends StatelessWidget {
  const DashboardSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: AppColors.primaryDark,
      child: Column(
  children: [
 

    const TopBar(),

    const SizedBox(height: 12),

   

    

    SidebarItem(
      icon: Icons.dashboard_outlined,
      title: "Dashboard",
      selected: true,
      onTap: () {},
    ),

    SidebarItem(
      icon: Icons.inventory_2_outlined,
      title: "Products",
      selected: false,
      onTap: () {},
    ),

    SidebarItem(
      icon: Icons.people_outline,
      title: "Suppliers",
      selected: false,
      onTap: () {},
    ),

    SidebarItem(
      icon: Icons.shopping_cart_outlined,
      title: "Purchases",
      selected: false,
      onTap: () {},
    ),

    SidebarItem(
      icon: Icons.warehouse_outlined,
      title: "Inventory",
      selected: false,
      onTap: () {},
    ),
  ],
)
    );
  }

  
}