import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_pilot/controllers/product_controlelr.dart';

import 'package:stock_pilot/theme/app_colors.dart';
import 'package:stock_pilot/views/products/add_products_screen.dart';
import 'package:stock_pilot/widgets/filter_widget.dart';
import 'package:stock_pilot/widgets/product_card.dart';
import 'package:stock_pilot/widgets/search_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

            AppSearchBar(
              hint: 'Search products',
              onchanged: (value) {
                productcontroller.onSearch(value);
              },
            ),

            const SizedBox(height: 12),

          
            Obx(() {
              return Row(
                children: [

                  Text(
                    '${productcontroller.filteredproducts.length} products',
                    style: TextStyle(
                        fontSize: 12, color: AppColors.primaryMid),
                  ),

                  const SizedBox(width: 15),
                  Flexible(child: FilterWidget(productcontroller: productcontroller)),

                  // sort button
                

                ],
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

                if (productcontroller.filteredproducts.isEmpty) {
                  return Center(
                    child: Text(
                      productcontroller.searchquery.value.isNotEmpty
                          ? 'No products match your search'
                          : 'No products yet\nTap + to add one',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13, color: Colors.grey.shade400),
                    ),
                  );
                }

                return RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () => productcontroller.fetchProducts(),
                  child: ListView.separated(
                    itemCount:
                        productcontroller.filteredproducts.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: productcontroller
                            .filteredproducts[index],
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