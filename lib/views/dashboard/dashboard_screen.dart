import 'package:flutter/material.dart';
import 'package:stock_pilot/views/dashboard/dashboard_body.dart';
import 'package:stock_pilot/views/orders/orders_history_screen.dart';

import 'package:stock_pilot/views/products/products_screen.dart';
import 'package:stock_pilot/views/supplier/supplier_screen.dart';
import 'package:stock_pilot/widgets/dashboard_topbar.dart';
import 'package:stock_pilot/widgets/side_drawer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  final List<String> pageTitles = [
    'Dashboard',
    'Products',
    'Suppliers',
    'Orders',
    'Inventory',
  ];

  // list of all pages in the same order as pageTitles
  final List<Widget> pages = const [
    DashboardBody(),
    ProductsScreen(),
    SuppliersScreen(),

OrdersScreen(),
    Center(child: Text('Inventory coming soon', style: TextStyle(color: Colors.grey))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppSidedrawer(
        selectedIndex: selectedIndex,
        onItemTapped: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: Column(
        children: [

          DashboardTopbar(
            pageTitle: pageTitles[selectedIndex],
          ),

          // shows the page based on selected index
          Expanded(child: pages[selectedIndex]),

        ],
      ),
    );
  }
}