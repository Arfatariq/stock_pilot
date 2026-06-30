import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';
import 'package:stock_pilot/views/supplier/add_supplier_screen.dart';

import 'package:stock_pilot/widgets/search_bar.dart';

import 'package:stock_pilot/widgets/supplier_stat_card.dart';

class SuppliersScreen extends StatelessWidget {
  const SuppliersScreen({super.key});

  final List<Map<String, dynamic>> suppliers = const [
    {
      'company': 'TechParts Ltd',
   
      'owner': 'Ali Hassan',
      'phone': '0312-4567890',
      'products': 38,
    },
    {
   'company': 'TechParts Ltd',
   
      'owner': 'Ali Hassan',
      'phone': '0312-4567890',
      'products': 38,
    },
    {
      'company': 'TechParts Ltd',
  
      'owner': 'Ali Hassan',
      'phone': '0312-4567890',
      'products': 38,
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
              builder: (context) => const AddSupplierScreen(),
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

            const AppSearchBar(hint: 'Search suppliers...'),

            const SizedBox(height: 14),

          
            Text(
              '${suppliers.length} suppliers',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),

            const SizedBox(height: 10),

            // suppliers list
            Expanded(
              child: ListView.separated(
                itemCount: suppliers.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return SupplierCard(supplier: suppliers[index]);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}