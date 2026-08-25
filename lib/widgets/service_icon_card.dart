import 'package:flutter/material.dart';

class ServiceIconCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback? onTap;

  const ServiceIconCard({
    super.key,
    required this.name,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: iconColor,
              size: 26,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: 'Gilroy-Regular',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.4,
              letterSpacing: 0,
              color: Color(0xFF1B1B1B),
            ),
          ),
        ],
      ),
    );
  }
}
