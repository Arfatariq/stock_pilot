import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_pilot/controllers/product_controlelr.dart';

import 'package:stock_pilot/theme/app_colors.dart';
import 'package:stock_pilot/views/products/add_products_screen.dart';
import 'package:stock_pilot/widgets/product_card.dart';
import 'package:stock_pilot/widgets/search_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // get controller — creates it if not already created
    final productcontroller = Get.put(ProductController());

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProductScreen(),
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

            // product count from controller
            Obx(() {
              return Text(
                '${productcontroller.products.length} products',
                style: TextStyle(
                    fontSize: 12, color: AppColors.primaryMid),
              );
            }),

            const SizedBox(height: 10),

            // products list
            Expanded(
              child: Obx(() {

         
                if (productcontroller.isloading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                }

                // empty state
                if (productcontroller.products.isEmpty) {
                  return Center(
                    child: Text(
                      'No products yet\nTap + to add one',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13, color: Colors.grey.shade400),
                    ),
                  );
                }

                // products list with pull to refresh
                return RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () => productcontroller.fetchProducts(),
                  child: ListView.separated(
                    itemCount: productcontroller.products.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: productcontroller.products[index],
                      );
                    },
                  ),
                );

              }),
            ),

          ],
        ),
      ),
    );
  }
}