import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';

class DashboardTopbar extends StatelessWidget {
  final String pageTitle;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DashboardTopbar({
    super.key,
    required this.pageTitle,
    required this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryDark,
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 14),
      child: Row(
        children: [

          // hamburger button to open drawer
          GestureDetector(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
            child: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 22,
            ),
          ),

          const SizedBox(width: 14),

          // page title
          Text(
            pageTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),

          const Spacer(),

          // search box
          Container(
            width: 160,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  size: 16,
                  color: Colors.white.withOpacity(0.6),
                ),
                const SizedBox(width: 6),
                Text(
                  'Search...',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 14),

          // username and avatar
          Row(
            children: [
              Text(
                'Arfa',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.primary,
                child: const Text(
                  'A',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}