import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  final String hint;

  const AppSearchBar({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [

          // search icon
          Icon(Icons.search, size: 18, color: Colors.grey.shade400),

          const SizedBox(width: 8),

          // search input
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                    color: Colors.grey.shade400, fontSize: 13),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),

        ],
      ),
    );
  }
}