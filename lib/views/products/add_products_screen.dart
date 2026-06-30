import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final namecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final stockcontroller = TextEditingController();
    final suppliercontroller = TextEditingController();

  

  @override
  void dispose() {
    namecontroller.dispose();
    descriptioncontroller.dispose();
    pricecontroller.dispose();
    stockcontroller.dispose();
    suppliercontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Add Product',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 8),

            // image upload box
            const Text(
              'Product image',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // image picker logic later
              },
              child: Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 32,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tap to upload image',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // product name
            const Text(
              'Product name',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                hintText: 'Enter product name',
                hintStyle: TextStyle(
                    color: Colors.grey.shade400, fontSize: 13),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 14),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: AppColors.primary, width: 1.5),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // description
            const Text(
              'Description',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: descriptioncontroller,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Enter product description',
                hintStyle: TextStyle(
                    color: Colors.grey.shade400, fontSize: 13),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 14),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: AppColors.primary, width: 1.5),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // price and stock side by side
            Row(
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Price (Rs.)',
                        style: TextStyle(
                            fontSize: 13, color: Colors.black54),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: pricecontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0.00',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, fontSize: 13),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 14),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: AppColors.primary, width: 1.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Stock qty',
                        style: TextStyle(
                            fontSize: 13, color: Colors.black54),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: stockcontroller,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, fontSize: 13),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 14),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: AppColors.primary, width: 1.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),

            const SizedBox(height: 16),

            // supplier dropdown
          // supplier
const Text(
  'Supplier',
  style: TextStyle(fontSize: 13, color: Colors.black54),
),
const SizedBox(height: 6),
TextField(
  controller: suppliercontroller,
  decoration: InputDecoration(
    hintText: 'Enter supplier name',
    hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
    contentPadding: const EdgeInsets.symmetric(
        horizontal: 14, vertical: 14),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
          color: AppColors.primary, width: 1.5),
    ),
  ),
),

            const SizedBox(height: 32),

            // add product button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // add product logic later
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Add product',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

          ],
        ),
      ),
    );
  }
}