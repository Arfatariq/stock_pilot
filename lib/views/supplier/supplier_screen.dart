import 'package:flutter/material.dart';
import 'package:stock_pilot/views/supplier/add_supplier_screen.dart';

class SupplierScreen extends StatelessWidget {
   SupplierScreen({super.key});
  final List<Map<String,dynamic>>suppliers = [
    {
      'company': 'TechParts Ltd',
    
      'supplier': 'Ali Hassan',
      'phone': '0312-4567890',
      'products': 38,

    },
    {
      'company': 'DinoTech',
    
      'supplier': 'Ali Hassan',
      'phone': '0312-4567890',
      'products': 38,

    },
    {
      'company': 'TechParts Ltd',
    
      'supplier': 'Ali Hassan',
      'phone': '0312-4567890',
      'products': 38,

    }



  ];

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor:Colors.white,
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddSupplierScreen()));
      }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchBar(hintText: 'search supplier',)
        ],
      ),
    );
  }
}