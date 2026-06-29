import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';
import 'package:stock_pilot/widgets/app_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SplashScreenLogo(size: 72),
            const SizedBox(height: 22),
            const Text(
              'StockPilot',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: -0.4,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Inventory management',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}