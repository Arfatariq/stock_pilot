import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';
import 'package:stock_pilot/views/products/add_products_screen.dart';

import 'package:stock_pilot/widgets/product_card.dart';

import 'package:stock_pilot/widgets/search_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      'name': 'USB-C Hub 7-in-1',
   
      'price': 'Rs. 2,400',
      'stock': 3,
    },
    {
      'name': 'Wireless Mouse Pro',
   
      'price': 'Rs. 1,850',
      'stock': 7,
    },
    {
      'name': 'Mechanical Keyboard TKL',
  
      'price': 'Rs. 5,200',
      'stock': 54,
    },
    {
      'name': 'Monitor 24" FHD',
   
      'price': 'Rs. 28,000',
      'stock': 31,
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
              builder: (context) => AddProductsScreen(),
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

            // search bar
            const AppSearchBar(hint: 'Search products...'),

            const SizedBox(height: 14),

            // product count
            Text(
              '${products.length} products',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),

            const SizedBox(height: 10),

            // products list
            Expanded(
              child: ListView.separated(
                itemCount: products.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index],);
                
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}