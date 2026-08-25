import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';

class StatCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData? icon;
  final Color? iconColor;
  final String? svgAsset;

  const StatCard({
    super.key,
    required this.value,
    required this.label,
    this.icon,
    this.iconColor,
    this.svgAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderLight, width: 1.2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (svgAsset != null) ...[
                SvgPicture.asset(
                  svgAsset!,
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 4),
              ] else if (icon != null) ...[
                Icon(
                  icon,
                  size: 16,
                  color: iconColor ?? AppColors.starGold,
                ),
                const SizedBox(width: 4),
              ],
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
