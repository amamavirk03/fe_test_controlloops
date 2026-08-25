import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.borderLight,
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              index: 0,
              iconAsset: 'assets/icons/home.svg',
              activeIconAsset: 'assets/icons/home_fill.svg',
              label: 'Home',
            ),
            _buildNavItem(
              index: 1,
              iconAsset: 'assets/icons/bookings.svg',
              activeIconAsset: 'assets/icons/bookings_fill.svg',
              label: 'Bookings',
            ),
            _buildNavItem(
              index: 2,
              iconAsset: 'assets/icons/chat.svg',
              activeIconAsset: 'assets/icons/chat_fill.svg',
              label: 'Chat',
            ),
            _buildNavItem(
              index: 3,
              iconAsset: 'assets/icons/profile_outline.svg',
              activeIconAsset: 'assets/icons/profile.svg',
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String iconAsset,
    required String activeIconAsset,
    required String label,
  }) {
    final isSelected = currentIndex == index;
    final color = isSelected ? AppColors.primaryTeal : AppColors.textMuted;

    return InkWell(
      onTap: () => onTap(index),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              isSelected ? activeIconAsset : iconAsset,
              width: 24,
              height: 24,
              colorFilter: isSelected
                  ? null
                  : const ColorFilter.mode(
                      AppColors.textMuted,
                      BlendMode.srcIn,
                    ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
