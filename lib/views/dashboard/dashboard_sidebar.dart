import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';

import 'package:stock_pilot/widgets/side_drawer_items.dart';
import 'package:stock_pilot/widgets/top_bar.dart';

class DashboardSidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const DashboardSidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 210,
      backgroundColor: AppColors.primaryDark,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TopBar(),
                 
               ) ],
              ),
            ),

            Divider(color: Colors.white.withOpacity(0.1), height: 1),
            const SizedBox(height: 10),

            SidedrawerItem(
              icon: Icons.dashboard_outlined,
              title: 'Dashboard',
              selected: selectedIndex == 0,
              onTap: () {
                onItemTapped(0);
                Navigator.pop(context); // close drawer
              },
            ),
            SidedrawerItem(
              icon: Icons.inventory_2_outlined,
              title: 'Products',
              selected: selectedIndex == 1,
              onTap: () {
                onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            SidedrawerItem(
              icon: Icons.store_outlined,
              title: 'Suppliers',
              selected: selectedIndex == 2,
              onTap: () {
                onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            SidedrawerItem(
              icon: Icons.shopping_cart_outlined,
              title: 'Orders',
              selected: selectedIndex == 3,
              onTap: () {
                onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            SidedrawerItem(
              icon: Icons.warehouse_outlined,
              title: 'Inventory',
              selected: selectedIndex == 4,
              onTap: () {
                onItemTapped(4);
                Navigator.pop(context);
              },
            ),

          ],
        ),
      ),
    );
  }
}