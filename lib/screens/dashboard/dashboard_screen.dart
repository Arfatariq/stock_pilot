import 'package:flutter/material.dart';
import 'package:stock_pilot/screens/dashboard/dashboard_sidebar.dart';



class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.grey.shade100,
      body: Row(
        children: [
          DashboardSidebar()
        ],
      ),

       
    );
  }
}