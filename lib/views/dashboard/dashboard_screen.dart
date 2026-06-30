import 'package:flutter/material.dart';
import 'package:stock_pilot/screens/dashboard/dashboard_body.dart';

import 'package:stock_pilot/widgets/dashboard_topbar.dart';
import 'package:stock_pilot/widgets/side_drawer.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // this key lets us open/close the drawer from anywhere
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedIndex = 0;

  final List<String> pageTitles = [
    'Dashboard',
    'Products',
    'Suppliers',
    'Purchases',
    'Inventory',
  ];

  // returns the right page based on selected sidebar item
  Widget getPage() {
    if (selectedIndex == 0) return const DashboardBody();

    // other pages coming soon
    return const Center(
      child: Text(
        'Coming soon',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // drawer opens when hamburger is tapped
      drawer: AppSidebar(
        selectedIndex: selectedIndex,
        onItemTapped: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: Column(
        children: [

          // topbar with hamburger, title, search, username
          DashboardTopbar(
            pageTitle: pageTitles[selectedIndex],
            scaffoldKey: scaffoldKey,
          ),

          // page content
          Expanded(child: getPage()),

        ],
      ),
    );
  }
}