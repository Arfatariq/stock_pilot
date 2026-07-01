import 'package:flutter/material.dart';
import 'package:stock_pilot/theme/app_colors.dart';


class AppLogo extends StatelessWidget {
  final double size;

  AppLogo({super.key, this.size = 72});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(size * 0.27),
      ),
      padding: EdgeInsets.all(size * 0.19),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: size * 0.07,
        mainAxisSpacing: size * 0.07,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _tile(AppColors.primaryLight.withOpacity(0.7)),
          _tile(AppColors.primaryMid),
          _tile(AppColors.primaryMid),
          _tile(Colors.white),
        ],
      ),
    );
  }

  Widget _tile(Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}