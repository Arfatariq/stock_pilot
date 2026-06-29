import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';

import 'package:stock_pilot/widgets/sidebar_items.dart';

class AppSidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const AppSidebar({
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

            // logo row
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
                    child: const Icon(
                      Icons.grid_view_rounded,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'StockPilot',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            Divider(color: Colors.white.withOpacity(0.1), height: 1),
            const SizedBox(height: 10),

            // nav items
            // when tapped — update selected index then close drawer
            SidebarItem(
              icon: Icons.dashboard_outlined,
              title: 'Dashboard',
              selected: selectedIndex == 0,
              onTap: () {
                onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            SidebarItem(
              icon: Icons.inventory_2_outlined,
              title: 'Products',
              selected: selectedIndex == 1,
              onTap: () {
                onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            SidebarItem(
              icon: Icons.store_outlined,
              title: 'Suppliers',
              selected: selectedIndex == 2,
              onTap: () {
                onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            SidebarItem(
              icon: Icons.shopping_cart_outlined,
              title: 'Purchases',
              selected: selectedIndex == 3,
              onTap: () {
                onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            SidebarItem(
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