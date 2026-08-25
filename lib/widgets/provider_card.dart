import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';

enum ProviderCardType { homeCompact, categoryDetailed }

class ProviderCard extends StatelessWidget {
  final Map<String, dynamic> provider;
  final ProviderCardType type;
  final VoidCallback? onTap;
  final VoidCallback? onBookTap;
  final VoidCallback? onBookmarkTap;

  const ProviderCard({
    super.key,
    required this.provider,
    this.type = ProviderCardType.categoryDetailed,
    this.onTap,
    this.onBookTap,
    this.onBookmarkTap,
  });

  @override
  Widget build(BuildContext context) {
    if (type == ProviderCardType.homeCompact) {
      return _buildHomeCompactCard(context);
    }
    return _buildCategoryDetailedCard(context);
  }

  Widget _buildHomeCompactCard(BuildContext context) {
    final name = provider['name'] as String? ?? '';
    final avatarUrl = provider['avatarUrl'] as String? ?? '';
    final tags = (provider['tags'] as List?)?.join(' • ') ?? '';
    final rating = (provider['rating'] as num?)?.toDouble() ?? 0.0;
    final isBookmarked = provider['isBookmarked'] as bool? ?? false;

    return Container(
      constraints: const BoxConstraints(minHeight: 113),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB5B5B5).withAlpha(38),
            blurRadius: 48,
            spreadRadius: 3,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 16, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAvatar(avatarUrl, name, 90, 89, 4),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Gilroy-Medium',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1B1B1B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tags,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Gilroy-Regular',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        color: Color(0xFF555555),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: const Color(0xFFE3E3E3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/star.svg',
                                width: 14,
                                height: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                rating.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontFamily: 'Gilroy-Medium',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF1B1B1B),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: onBookmarkTap,
                          borderRadius: BorderRadius.circular(6),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: SvgPicture.asset(
                              isBookmarked
                                  ? 'assets/icons/save_fill_icon.svg'
                                  : 'assets/icons/save_icon.svg',
                              width: 20,
                              height: 20,
                              colorFilter: ColorFilter.mode(
                                AppColors.primaryTeal,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryDetailedCard(BuildContext context) {
    final name = provider['name'] as String? ?? '';
    final avatarUrl = provider['avatarUrl'] as String? ?? '';
    final rating = (provider['rating'] as num?)?.toDouble() ?? 0.0;
    final reviewCountText = provider['reviewCountText'] as String? ?? '';
    final hourlyRate = (provider['hourlyRate'] as num?)?.toInt() ?? 0;
    final isBookmarked = provider['isBookmarked'] as bool? ?? false;

    return Container(
      constraints: const BoxConstraints(minHeight: 113),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFB5B5B5).withAlpha(38),
            blurRadius: 48,
            spreadRadius: 3,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAvatar(avatarUrl, name, 90, 89, 4),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'Gilroy-Medium',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1B1B1B),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: onBookmarkTap,
                          borderRadius: BorderRadius.circular(6),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: SvgPicture.asset(
                              isBookmarked
                                  ? 'assets/icons/save_fill_icon.svg'
                                  : 'assets/icons/save_icon.svg',
                              width: 20,
                              height: 20,
                              colorFilter: const ColorFilter.mode(
                                Color(0xFF004E42),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: const Color(0xFFE3E3E3),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/star.svg',
                                width: 14,
                                height: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                rating.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontFamily: 'Gilroy-Medium',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF1B1B1B),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          reviewCountText,
                          style: const TextStyle(
                            fontFamily: 'Gilroy-Regular',
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                            color: Color(0xFF676767),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '\$$hourlyRate/hr',
                          style: const TextStyle(
                            fontFamily: 'Gilroy-Medium',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                            color: Color(0xFF1B1B1B),
                          ),
                        ),
                        SizedBox(
                          width: 68,
                          height: 38,
                          child: ElevatedButton(
                            onPressed: onBookTap ?? onTap,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF004E42),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Book',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(
    String url,
    String name,
    double width,
    double height,
    double radius,
  ) {
    final isAsset = url.startsWith('assets/');
    final hasValidUrl =
        url.trim().isNotEmpty && (isAsset || url.startsWith('http'));

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: width,
        height: height,
        color: const Color(0xFFD8D8D8),
        child: hasValidUrl
            ? (isAsset
                  ? Image.asset(
                      url,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildFallback(name),
                    )
                  : Image.network(
                      url,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildFallback(name),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return _buildFallback(name);
                      },
                    ))
            : _buildFallback(name),
      ),
    );
  }

  Widget _buildFallback(String name) {
    return Container(
      color: AppColors.pastelIndigoBg,
      alignment: Alignment.center,
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : 'P',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryTeal,
        ),
      ),
    );
  }
}
