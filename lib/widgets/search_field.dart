import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final bool readOnly;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final Widget? trailing;

  const CustomSearchField({
    super.key,
    this.hintText = 'Search services, providers..',
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.readOnly = false,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.borderRadius = 8,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != Colors.transparent
            ? Border.all(color: borderColor, width: 1)
            : null,
      ),
      child: Row(
        children: [
          const SizedBox(width: 14),
          SvgPicture.asset(
            'assets/icons/search_icon.svg',
            width: 18,
            height: 18,
            placeholderBuilder: (context) => const Icon(
              Icons.search_rounded,
              color: Color(0xFFA3A3A3),
              size: 18,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              readOnly: readOnly,
              onTap: onTap,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              style: const TextStyle(
                fontFamily: 'Gilroy-Regular',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.textPrimary,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontFamily: 'Gilroy-Regular',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                  color: Color(0xFFA3A3A3),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          if (trailing != null) ...[trailing!, const SizedBox(width: 8)],
        ],
      ),
    );
  }
}
