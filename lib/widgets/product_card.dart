import 'package:flutter/material.dart';
import 'package:stock_pilot/models/product_model.dart';
import 'package:stock_pilot/theme/app_colors.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [

          // product image — real or placeholder
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: product.imageUrl != null && product.imageUrl!.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      product.imageUrl!,
                      fit: BoxFit.cover,
                      // show spinner while image loads
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return const Center(
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.primary,
                            ),
                          ),
                        );
                      },
                      // show icon if image fails to load
                      errorBuilder: (context, error, stack) {
                        return Icon(
                          Icons.inventory_2_outlined,
                          size: 22,
                          color: AppColors.primary,
                        );
                      },
                    ),
                  )
                // no image url — show placeholder icon
                : Icon(
                    Icons.inventory_2_outlined,
                    size: 22,
                    color: AppColors.primary,
                  ),
          ),

          const SizedBox(width: 12),

          // product name, supplier, price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryDark,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  product.supplier,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),

                const SizedBox(height: 3),

                // toStringAsFixed(0) removes the .0 decimal
                Text(
                  'Rs. ${product.price.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),

              ],
            ),
          ),

          // stock count
          Text(
            '${product.stock} units',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
            ),
          ),

        ],
      ),
    );
  }
}