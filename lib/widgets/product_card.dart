import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
    final Map<String, dynamic> product;
  const ProductCard({super.key, required this.product, required Map<String, dynamic> products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white
        ),
        child: Row(
          children: [
            Container(
              height:50,
              width: 50,
              decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        child: Icon(Icons.inventory_rounded,
        color: Colors.blueAccent,
        ),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  product['Name']
                  ),
                  Text(
                    product['price']
                  )
              ],
            ),
          ),
          Text(
            '${product['stock']} units',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
            ),
          ),
          ],
          
        ),
      ),
    );
  }
}