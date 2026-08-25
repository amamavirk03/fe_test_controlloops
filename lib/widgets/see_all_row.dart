import 'package:flutter/material.dart';

class SeeAllRow extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback? onSeeAll;

  const SeeAllRow({
    super.key,
    required this.title,
    this.actionText = 'See all',
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Gilroy-Medium',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: Color(0xFF1B1B1B),
          ),
        ),
        InkWell(
          onTap: onSeeAll,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Text(
              actionText,
              style: const TextStyle(
                fontFamily: 'Gilroy-Regular',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.4,
                color: Color(0xFF004E42),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
