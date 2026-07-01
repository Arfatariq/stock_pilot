import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:stock_pilot/controllers/order_controllers.dart';
import 'package:stock_pilot/theme/app_colors.dart';

class AddOrdersScreen extends StatefulWidget {
  const AddOrdersScreen({super.key});

  @override
  State<AddOrdersScreen> createState() => _AddOrdersScreenState();
}

class _AddOrdersScreenState extends State<AddOrdersScreen> {
  final productnamecontroller = TextEditingController();
  final descriptioncontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  final quantitycontroller = TextEditingController();
  final suppliercontroller = TextEditingController();

  final ordercontroller = Get.put(OrderController());
    final imagepicker = ImagePicker();

  @override
  void dispose() {
    productnamecontroller.dispose();
    descriptioncontroller.dispose();
    pricecontroller.dispose();
    quantitycontroller.dispose();
    suppliercontroller.dispose();
    super.dispose();
  }
   Future<void> pickImage() async {
    final picked = await imagepicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70, 
    );

    if (picked != null) {
      ordercontroller.setImage(File(picked.path));
    }
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
          'Add Order',
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
const SizedBox(height: 16),

const Text(
  'Product Image',
  style: TextStyle(
    fontSize: 13,
    color: Colors.black54,
  ),
),

const SizedBox(height: 8),

GestureDetector(
  onTap: () async {
  await pickImage();
},
  child: Obx(() {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ordercontroller.selectedimage.value == null
          ? const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image_outlined,
                    size: 40, color: Colors.grey),
                SizedBox(height: 8),
                Text('Tap to select image'),
              ],
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                ordercontroller.selectedimage.value!,
                fit: BoxFit.cover,
              ),
            ),
    );
  }),
),
         
            const Text(
              'Product name',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: productnamecontroller,
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
                hintText: 'Enter description',
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

            // price and quantity side by side
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
                        'Quantity',
                        style: TextStyle(
                            fontSize: 13, color: Colors.black54),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                        controller: quantitycontroller,
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

            const SizedBox(height: 32),

            // add order button
            Obx(() {
              return SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ordercontroller.isadding.value
                      ? null
                      : () {
                          ordercontroller.addOrder(
                            productname:
                                productnamecontroller.text.trim(),
                            description:
                                descriptioncontroller.text.trim(),
                            price: pricecontroller.text.trim(),
                            quantity: quantitycontroller.text.trim(),
                            supplier: suppliercontroller.text.trim(),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: ordercontroller.isadding.value
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Add order',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
              );
            }),

            const SizedBox(height: 24),

          ],
        ),
      ),
    );
  }
}