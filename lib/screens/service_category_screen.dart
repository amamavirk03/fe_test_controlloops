import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/category_controller.dart';
import '../controllers/navigation_controller.dart';
import '../controllers/provider_controller.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/provider_card.dart';
import 'service_provider_detail_screen.dart';

class ServiceCategoryScreen extends StatefulWidget {
  final String categoryTitle;

  const ServiceCategoryScreen({
    super.key,
    this.categoryTitle = 'Home cleaning',
  });

  @override
  State<ServiceCategoryScreen> createState() => _ServiceCategoryScreenState();
}

class _ServiceCategoryScreenState extends State<ServiceCategoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  late final CategoryController _categoryCtrl;
  late final List<Map<String, dynamic>> _allProviders;

  @override
  void initState() {
    super.initState();
    _categoryCtrl = Get.put(CategoryController());
    _categoryCtrl.resetFilters();

    _allProviders = [
      {
        'id': 'jonathan_ken',
        'name': 'Jonathan Ken',
        'avatarUrl': 'assets/profile-images/person3.png',
        'coverImageUrl': 'assets/images/detail_banner.png',
        'rating': 4.9,
        'reviewCountText': '1.5k reviews',
        'totalReviews': 1520,
        'hourlyRate': 30,
        'address': 'Cluster G, JLT, Dubai',
        'tags': ['Cleaning', 'Sanitizing', '+1 more'],
        'services': ['Deep Clean', 'Window Wash', 'Sanitizing'],
        'serviceDescriptions': {
          'Deep Clean':
              'Full residential deep cleaning covering bathrooms, kitchen degreasing, and bedroom vacuuming.',
          'Window Wash':
              'Spotless interior and exterior high-rise window scrubbing.',
          'Sanitizing':
              'Medical-grade hospital disinfectant application across all touchpoints.',
        },
        'about':
            'Expert residential sanitation specialist with certified eco-friendly solutions and satisfaction guarantee.',
        'totalBookings': 28,
        'servicesOfferedCount': 3,
        'staffCount': 8,
        'isFullyBooked': false,
        'isBookmarked': true,
        'reviewerAvatars': [
          'assets/profile-images/person2.png',
          'assets/profile-images/person3.png',
          'assets/profile-images/person4.png',
        ],
        'galleryImages': [
          'assets/images/cook1.png',
          'assets/images/cook2.png',
          'assets/images/cook3.png',
        ],
      },
      {
        'id': 'elliot_james',
        'name': 'Elliot James',
        'avatarUrl': 'assets/profile-images/person4.png',
        'coverImageUrl': 'assets/images/detail_banner.png',
        'rating': 4.5,
        'reviewCountText': '1.1k reviews',
        'totalReviews': 1130,
        'hourlyRate': 25,
        'address': 'Villa 14, Al Wasl Road, Jumeirah 1, Dubai',
        'tags': ['Carpentry', 'Furniture', '+2 more'],
        'services': ['Custom Woodwork', 'Cabinet Repair', 'Door Fitting'],
        'serviceDescriptions': {
          'Custom Woodwork':
              'Handcrafted wood fittings, shelf alignment, and antique restoration.',
          'Cabinet Repair':
              'Hinge fixing, sliding track alignment, and surface polish.',
          'Door Fitting':
              'Solid wood and veneer interior door installation with secure locks.',
        },
        'about':
            'Master carpenter with over 7 years in custom furniture building and structural wood repairs.',
        'totalBookings': 18,
        'servicesOfferedCount': 4,
        'staffCount': 5,
        'isFullyBooked': false,
        'isBookmarked': false,
        'reviewerAvatars': [
          'assets/profile-images/person2.png',
          'assets/profile-images/person3.png',
          'assets/profile-images/person4.png',
        ],
        'galleryImages': [
          'assets/images/cook1.png',
          'assets/images/cook2.png',
          'assets/images/cook3.png',
        ],
      },
      {
        'id': 'sarah_milner',
        'name': 'Sarah Milner',
        'avatarUrl': 'assets/profile-images/person5.png',
        'coverImageUrl': 'assets/images/detail_banner.png',
        'rating': 4.7,
        'reviewCountText': '1.4k reviews',
        'totalReviews': 1410,
        'hourlyRate': 28,
        'address': 'Executive Towers, Business Bay, Dubai',
        'tags': ['Laundry', 'Dry Clean', '+1 more'],
        'services': ['Express Laundry', 'Steam Ironing', 'Curtain Cleaning'],
        'serviceDescriptions': {
          'Express Laundry':
              'Fast 4-hour turnaround for everyday garments and luxury silks.',
          'Steam Ironing':
              'Wrinkle-free high-temperature delicate steam finishing.',
          'Curtain Cleaning':
              'On-site fabric rejuvenation and drapes sanitization.',
        },
        'about':
            'Professional textile and laundry supervisor ensuring crisp, fresh fabrics every time.',
        'totalBookings': 32,
        'servicesOfferedCount': 3,
        'staffCount': 14,
        'isFullyBooked': false,
        'isBookmarked': false,
        'reviewerAvatars': [
          'assets/profile-images/person2.png',
          'assets/profile-images/person3.png',
          'assets/profile-images/person4.png',
        ],
        'galleryImages': [
          'assets/images/cook1.png',
          'assets/images/cook2.png',
          'assets/images/cook3.png',
        ],
      },
      {
        'id': 'sam_davies',
        'name': 'Sam Davies',
        'avatarUrl': 'assets/profile-images/person1.png',
        'coverImageUrl': 'assets/images/detail_banner.png',
        'rating': 4.6,
        'reviewCountText': '2.2k reviews',
        'totalReviews': 2200,
        'hourlyRate': 22,
        'address': 'Lake Point Tower, Cluster J, JLT, Dubai',
        'tags': ['Cooking', 'Laundry', '+2 more'],
        'services': ['Cooking', 'Deep Cleaning', 'Organization'],
        'serviceDescriptions': {
          'Cooking':
              'Delicious meal preparation customized to dietary needs (Keto, Vegan, Halal).',
          'Deep Cleaning':
              'Thorough kitchen, living room, and balcony pressure washing.',
          'Organization':
              'Wardrobe sorting, pantry cataloging, and decluttering.',
        },
        'about':
            'All-round home assistant and chef ready to keep your home tidy and meals fresh.',
        'totalBookings': 45,
        'servicesOfferedCount': 3,
        'staffCount': 9,
        'isFullyBooked': false,
        'isBookmarked': false,
        'reviewerAvatars': [
          'assets/profile-images/person2.png',
          'assets/profile-images/person3.png',
          'assets/profile-images/person4.png',
        ],
        'galleryImages': [
          'assets/images/cook1.png',
          'assets/images/cook2.png',
          'assets/images/cook3.png',
        ],
      },
      {
        'id': 'jane_mia',
        'name': 'Jane Mia',
        'avatarUrl': 'assets/profile-images/person6.png',
        'coverImageUrl': 'assets/images/detail_banner.png',
        'rating': 4.8,
        'reviewCountText': '1.3k reviews',
        'totalReviews': 1340,
        'hourlyRate': 28,
        'address': 'Downtown Heights, Boulevard Walk, Dubai',
        'tags': ['Electric work', 'Repairs', '+1 more'],
        'services': ['Wiring & Lighting', 'AC Diagnostic', 'Switch Repairs'],
        'serviceDescriptions': {
          'Wiring & Lighting':
              'Safe, certified high & low voltage wiring, smart switch installations, and chandelier mounting.',
          'AC Diagnostic':
              'Thermostat calibration, compressor checks, and duct airflow tests.',
          'Switch Repairs':
              'Breaker replacement and surge protection installation.',
        },
        'about':
            'Certified electrician specialized in home safety checks and swift emergency repairs.',
        'totalBookings': 29,
        'servicesOfferedCount': 2,
        'staffCount': 6,
        'isFullyBooked': false,
        'isBookmarked': false,
        'reviewerAvatars': [
          'assets/profile-images/person2.png',
          'assets/profile-images/person3.png',
          'assets/profile-images/person4.png',
        ],
        'galleryImages': [
          'assets/images/cook1.png',
          'assets/images/cook2.png',
          'assets/images/cook3.png',
        ],
      },
    ];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openDetailScreen(Map<String, dynamic> provider) {
    Get.to(
      () => ServiceProviderDetailScreen(provider: provider),
      transition: Transition.noTransition,
    );
  }

  List<Map<String, dynamic>> _computeFilteredProviders() {
    final query = _categoryCtrl.searchQuery.value.trim().toLowerCase();
    final minRat = _categoryCtrl.minRating.value;
    final sortPrice = _categoryCtrl.sortByPrice.value;

    List<Map<String, dynamic>> list = _allProviders.where((p) {
      if (query.isEmpty) return true;
      final name = (p['name'] as String? ?? '').toLowerCase();
      final tags = (p['tags'] as List? ?? [])
          .map((e) => e.toString().toLowerCase())
          .toList();
      final services = (p['services'] as List? ?? [])
          .map((e) => e.toString().toLowerCase())
          .toList();
      return name.contains(query) ||
          tags.any((t) => t.contains(query)) ||
          services.any((s) => s.contains(query));
    }).toList();

    if (minRat != null) {
      list = list
          .where((p) => ((p['rating'] as num?)?.toDouble() ?? 0.0) >= minRat)
          .toList();
    }

    if (sortPrice) {
      list = List.from(list)
        ..sort((a, b) {
          final pa = (a['hourlyRate'] as int?) ?? 0;
          final pb = (b['hourlyRate'] as int?) ?? 0;
          return pa.compareTo(pb);
        });
    }

    return list;
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Filter Providers',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close_rounded),
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/star.svg',
                    width: 20,
                    height: 20,
                  ),
                  title: const Text('Top Rated (> 4.7)'),
                  onTap: () {
                    Get.back();
                    _categoryCtrl.filterTopRated();
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.attach_money_rounded,
                    color: AppColors.primaryTeal,
                  ),
                  title: const Text('Price: Low to High'),
                  onTap: () {
                    Get.back();
                    _categoryCtrl.filterPriceLowToHigh();
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.restart_alt_rounded,
                    color: AppColors.textSecondary,
                  ),
                  title: const Text('Reset All Filters'),
                  onTap: () {
                    Get.back();
                    _searchController.clear();
                    _categoryCtrl.resetFilters();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final navCtrl = Get.find<NavigationController>();
    final providerCtrl = Get.find<ProviderController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF1F1F1),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/icons/arrow-left.svg',
                        width: 16,
                        height: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.categoryTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Gilroy-Medium',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        color: Color(0xFF1B1B1B),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color.fromRGBO(0, 78, 66, 0.4),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
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
                              controller: _searchController,
                              onChanged: _categoryCtrl.setSearchQuery,
                              style: const TextStyle(
                                fontFamily: 'Gilroy-Regular',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF1B1B1B),
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Search providers',
                                hintStyle: TextStyle(
                                  fontFamily: 'Gilroy-Regular',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFA3A3A3),
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 11,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),
                  InkWell(
                    onTap: _showFilterModal,
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 52,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color.fromRGBO(0, 78, 66, 0.4),
                          width: 1,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        'assets/icons/filter.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                final filtered = _computeFilteredProviders();
                if (filtered.isEmpty) {
                  return const Center(
                    child: Text(
                      'No providers found matching your search.',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final provider = filtered[index];
                    final providerId = provider['id'] as String;
                    return Obx(() {
                      final isBookmarked = providerCtrl.isProviderBookmarked(
                        providerId,
                      );
                      final mergedProvider = Map<String, dynamic>.from(
                        provider,
                      );
                      mergedProvider['isBookmarked'] = isBookmarked;

                      return ProviderCard(
                        provider: mergedProvider,
                        type: ProviderCardType.categoryDetailed,
                        onTap: () => _openDetailScreen(mergedProvider),
                        onBookTap: () => _openDetailScreen(mergedProvider),
                        onBookmarkTap: () =>
                            providerCtrl.toggleBookmark(providerId),
                      );
                    });
                  },
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(
          currentIndex: navCtrl.currentIndex.value,
          onTap: (index) {
            navCtrl.changeIndex(index);
            Get.back();
          },
        ),
      ),
    );
  }
}
