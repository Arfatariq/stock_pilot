import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';
import 'package:stock_pilot/views/orders/add_orders_screen.dart';



import 'package:stock_pilot/widgets/product_card.dart';

import 'package:stock_pilot/widgets/search_bar.dart';

class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({super.key});

  final List<Map<String, dynamic>> orders = const [
    {
      'name': 'USB-C ',
   
      'price': 'Rs. 2,400',
      'status': 'delievered',
    },
    {
      'name': 'Wireless Mouse Pro',
   
      'price': 'Rs. 1,850',
      'status': 'pending',
    },
    {
      'name': 'Mechanical Keyboard',
  
      'price': 'Rs. 5,200',
      'status': 'pending',
    },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddOrdersScreen(),
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const AppSearchBar(hint: 'Search products...'),

            const SizedBox(height: 14),

           
            Text(
              '${orders.length} products',
              style: TextStyle(fontSize: 12, color: AppColors.primaryMid),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.separated(
                itemCount: orders.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return ProductCard(product: orders[index],);
                
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}