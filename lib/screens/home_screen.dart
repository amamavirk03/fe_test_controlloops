import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/navigation_controller.dart';
import '../controllers/provider_controller.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/provider_card.dart';
import '../widgets/search_field.dart';
import '../widgets/see_all_row.dart';
import '../widgets/service_icon_card.dart';
import 'bookings_screen.dart';
import 'chats_screen.dart';
import 'profile_screen.dart';
import 'service_category_screen.dart';
import 'service_provider_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();

  final _services = const [
    {
      'name': 'Cleaning',
      'icon': Icons.cleaning_services_rounded,
      'iconColor': AppColors.pastelPurpleIcon,
    },
    {
      'name': 'Carpentry',
      'icon': Icons.handyman_rounded,
      'iconColor': AppColors.pastelOrangeIcon,
    },
    {
      'name': 'Laundry',
      'icon': Icons.local_laundry_service_rounded,
      'iconColor': AppColors.pastelGreenIcon,
    },
    {
      'name': 'Painting',
      'icon': Icons.format_paint_rounded,
      'iconColor': AppColors.pastelYellowIcon,
    },
    {
      'name': 'Logistics',
      'icon': Icons.local_shipping_rounded,
      'iconColor': AppColors.pastelBlueIcon,
    },
    {
      'name': 'Cooking',
      'icon': Icons.soup_kitchen_rounded,
      'iconColor': AppColors.pastelOrangeIcon,
    },
    {
      'name': 'Electric work',
      'icon': Icons.engineering_rounded,
      'iconColor': AppColors.pastelIndigoIcon,
    },
    {
      'name': 'Plumbing',
      'icon': Icons.plumbing_rounded,
      'iconColor': AppColors.pastelBlueIcon,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _openCategory(String title) {
    Get.to(
      () => ServiceCategoryScreen(categoryTitle: title),
      transition: Transition.noTransition,
    );
  }

  void _openDetail(Map<String, dynamic> provider) {
    Get.to(
      () => ServiceProviderDetailScreen(provider: provider),
      transition: Transition.noTransition,
    );
  }

  @override
  Widget build(BuildContext context) {
    final navCtrl = Get.find<NavigationController>();
    final providerCtrl = Get.find<ProviderController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(
        () => IndexedStack(
          index: navCtrl.currentIndex.value,
          children: [
            _buildHome(providerCtrl),
            const BookingsView(),
            const ChatsView(),
            const ProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNavBar(
          currentIndex: navCtrl.currentIndex.value,
          onTap: navCtrl.changeIndex,
        ),
      ),
    );
  }

  Widget _buildHome(ProviderController providerCtrl) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SeeAllRow(title: 'Services', onSeeAll: () {}),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildServicesGrid(),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SeeAllRow(
              title: 'Top providers',
              onSeeAll: () => _openCategory('Top Providers'),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(
              () => Column(
                children: providerCtrl.providers
                    .map(
                      (provider) => ProviderCard(
                        provider: provider,
                        type: ProviderCardType.homeCompact,
                        onTap: () => _openDetail(provider),
                        onBookmarkTap: () => providerCtrl.toggleBookmark(
                          provider['id'] as String,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF004E42),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        child: CustomPaint(
          painter: _HeaderPainter(),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Container(
                          width: 56,
                          height: 56,
                          color: const Color(0xFF00382F),
                          child: Image.asset(
                            'assets/profile-images/person1.png',
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => const Center(
                              child: Text(
                                'J',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome,',
                              style: TextStyle(
                                fontFamily: 'Gilroy-Medium',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1.5,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Jane 👋',
                              style: TextStyle(
                                fontFamily: 'Gilroy-Regular',
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1.3,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: const BoxDecoration(
                              color: Color(0xFF004E42),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              'assets/icons/notification.svg',
                              width: 24,
                              height: 24,
                            ),
                          ),
                          Positioned(
                            top: 15,
                            right: 17,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: AppColors.badgeRed,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(
                    width: 181,
                    child: Text(
                      'What service do\nyou need?',
                      style: TextStyle(
                        fontFamily: 'Gilroy-Medium',
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        height: 1.4,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomSearchField(
                    controller: _searchController,
                    onSubmitted: (q) =>
                        _openCategory(q.isNotEmpty ? q : 'Home cleaning'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildServicesGrid() {
    return Column(
      children: [
        Row(
          children: List.generate(4, (i) => Expanded(child: _serviceItem(i))),
        ),
        const SizedBox(height: 20),
        Row(
          children: List.generate(
            4,
            (i) => Expanded(child: _serviceItem(i + 4)),
          ),
        ),
      ],
    );
  }

  Widget _serviceItem(int i) {
    if (i >= _services.length) return const SizedBox.shrink();
    final s = _services[i];
    return ServiceIconCard(
      name: s['name'] as String,
      icon: s['icon'] as IconData,
      backgroundColor: AppColors.categoryCircleBg,
      iconColor: s['iconColor'] as Color,
      onTap: () => _openCategory(s['name'] as String),
    );
  }
}

class _HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = const Color(0xFF004E42),
    );

    final path = Path()
      ..moveTo(size.width * 0.34, 0)
      ..lineTo(size.width * 0.38, size.height * 0.28)
      ..lineTo(size.width, size.height * 0.94)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, Paint()..color = const Color(0xFF1B5C51));
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}
