import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardTopbar extends StatelessWidget {
  final String pageTitle;

  const DashboardTopbar({
    super.key,
    required this.pageTitle,
  });

  // get current logged in user name from supabase
  String getUserName() {
    final user = Supabase.instance.client.auth.currentUser;

    // we saved name in user_metadata during signup
    if (user != null && user.userMetadata != null) {
      final name = user.userMetadata!['name'];
      if (name != null && name.toString().isNotEmpty) {
        return name.toString();
      }
    }

    // fallback to email if name not found
    return user?.email?.split('@').first ?? 'User';
  }

  // get first letter of name for avatar
  String getInitial() {
    final name = getUserName();
    return name.isNotEmpty ? name[0].toUpperCase() : 'U';
  }

  @override
  Widget build(BuildContext context) {
    final username = getUserName();
    final initial = getInitial();

    return Container(
      color: AppColors.primaryDark,
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 14),
      child: Row(
        children: [

          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
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

          const SizedBox(width: 5),

          Row(
            children: [
              Text(
                username,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(width: 8),
              CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.primary,
                child: Text(
                  initial,
                  style: const TextStyle(
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