import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';

class AddSupplierScreen extends StatefulWidget {
  const AddSupplierScreen({super.key});

  @override
  State<AddSupplierScreen> createState() => _AddSupplierScreenState();
}

class _AddSupplierScreenState extends State<AddSupplierScreen> {
  final namecontroller = TextEditingController();
  final contactcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final addresscontroller = TextEditingController();

  @override
  void dispose() {
    namecontroller.dispose();
    contactcontroller.dispose();
    phonecontroller.dispose();
    emailcontroller.dispose();
    addresscontroller.dispose();
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
          'Add Supplier',
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

            // supplier name
            const Text(
              'Supplier name',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: namecontroller,
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

            const SizedBox(height: 16),

            // contact person
            const Text(
              'Contact person',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: contactcontroller,
              decoration: InputDecoration(
                hintText: 'Enter contact name',
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

            // phone number
            const Text(
              'Phone number',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: phonecontroller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '03xx-xxxxxxx',
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

            // email
            const Text(
              'Email',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'supplier@email.com',
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

            // address
            const Text(
              'Address',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: addresscontroller,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Enter address',
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

            // add supplier button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // add supplier logic later
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Add supplier',
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