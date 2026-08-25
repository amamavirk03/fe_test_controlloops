import 'package:get/get.dart';

class ProviderController extends GetxController {
  final RxList<Map<String, dynamic>> providers = <Map<String, dynamic>>[].obs;
  final RxString activeCategory = 'All Services'.obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadInitialData();
  }

  void loadInitialData() {
    providers.assignAll([
      {
        'id': 'sam_davies',
        'name': 'Sam Davies',
        'avatarUrl': 'assets/profile-images/person2.png',
        'coverImageUrl': 'assets/images/detail_banner.png',
        'rating': 4.9,
        'reviewCountText': '2.2k reviews',
        'totalReviews': 2200,
        'hourlyRate': 22,
        'address': 'Lake Point Tower, Cluster J, JLT, Dubai',
        'tags': ['Cooking', 'Laundry', '+2 more'],
        'services': ['Cooking', 'Plumbing', 'Laundry'],
        'serviceDescriptions': {
          'Cooking':
              "Professional chef and home cleaner with over 4 years of experience.",
          'Plumbing':
              "Expert residential plumbing leak diagnostics and fixture installations.",
          'Laundry': "Delicate garment washing, steam press, and fabric care.",
        },
        'about':
            "Professional home cleaner with over 4 years of experience delivering top-quality cleaning services across Dubai.",
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
        'id': 'jonathan_davies',
        'name': 'Jonathan Davies',
        'avatarUrl': 'assets/profile-images/person6.png',
        'coverImageUrl': 'assets/images/detail_banner.png',
        'rating': 4.9,
        'reviewCountText': '1.5k reviews',
        'totalReviews': 1575,
        'hourlyRate': 30,
        'address': 'Villa 27, Street 12, Al Barsha 2, Dubai',
        'tags': ['Cooking', 'Laundry', '+2 more'],
        'services': ['Cooking', 'Plumbing', 'Laundry'],
        'serviceDescriptions': {
          'Cooking': "Culinary specialist with 4+ years experience.",
          'Plumbing': "Comprehensive plumbing and instant drain maintenance.",
          'Laundry': "Premium laundry service covering steam press.",
        },
        'about':
            "Professional home cleaner & culinary specialist delivering top-quality services.",
        'totalBookings': 10,
        'servicesOfferedCount': 3,
        'staffCount': 12,
        'isFullyBooked': true,
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
        'id': 'jonathan_ken',
        'name': 'Jonathan Ken',
        'avatarUrl': 'assets/profile-images/person4.png',
        'coverImageUrl': 'assets/images/detail_banner.png',
        'rating': 4.9,
        'reviewCountText': '1.5k reviews',
        'totalReviews': 1520,
        'hourlyRate': 30,
        'address': 'Cluster G, JLT, Dubai',
        'tags': ['Cleaning', 'Sanitizing', '+1 more'],
        'services': ['Deep Clean', 'Window Wash'],
        'serviceDescriptions': {
          'Deep Clean': 'Full residential deep cleaning covering bathrooms.',
        },
        'about': 'Expert residential sanitation specialist.',
        'totalBookings': 28,
        'servicesOfferedCount': 2,
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
    ]);
  }

  void toggleBookmark(String id) {
    final index = providers.indexWhere((p) => p['id'] == id);
    if (index != -1) {
      final current = providers[index];
      final updated = Map<String, dynamic>.from(current);
      updated['isBookmarked'] = !(current['isBookmarked'] as bool? ?? false);
      providers[index] = updated;
    }
  }

  bool isProviderBookmarked(String id) {
    final p = providers.firstWhereOrNull((item) => item['id'] == id);
    return (p?['isBookmarked'] as bool?) ?? false;
  }
}
