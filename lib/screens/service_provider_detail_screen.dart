import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/detail_controller.dart';
import '../controllers/navigation_controller.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/see_all_row.dart';

class ServiceProviderDetailScreen extends StatefulWidget {
  final Map<String, dynamic> provider;
  const ServiceProviderDetailScreen({super.key, required this.provider});

  @override
  State<ServiceProviderDetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<ServiceProviderDetailScreen> {
  late final DetailController _ctrl;

  Map<String, dynamic> get p => widget.provider;

  @override
  void initState() {
    super.initState();
    _ctrl = Get.put(DetailController());
    final services = p['services'] as List? ?? ['Cooking'];
    _ctrl.selectedService.value = services.isNotEmpty ? services.first.toString() : 'Cooking';
  }

  @override
  Widget build(BuildContext context) {
    final navCtrl = Get.find<NavigationController>();

    final name = p['name'] as String? ?? 'Jonathan Davies';
    final avatarUrl = p['avatarUrl'] as String? ?? 'assets/profile-images/person6.png';
    final coverUrl = p['coverImageUrl'] as String? ?? 'assets/images/detail_banner.png';
    final rating = (p['rating'] as num?)?.toDouble() ?? 4.9;
    final totalReviews = (p['totalReviews'] as num?)?.toInt() ?? 1575;
    final address = p['address'] as String? ?? 'Villa 27, Street 12, Al Barsha 2, Dubai';
    final services = (p['services'] as List?)?.map((e) => e.toString()).toList() ?? ['Cooking', 'Plumbing', 'Laundry'];
    final descriptions = (p['serviceDescriptions'] is Map) ? p['serviceDescriptions'] as Map : {};
    final about = p['about'] as String? ?? "Hi, I'm $name — a professional home cleaner with over 4 years of experience.";
    final totalBookings = (p['totalBookings'] as num?)?.toInt() ?? 10;
    final servicesCount = (p['servicesOfferedCount'] as num?)?.toInt() ?? 3;
    final staffCount = (p['staffCount'] as num?)?.toInt() ?? 12;
    final isFullyBooked = p['isFullyBooked'] as bool? ?? true;
    final avatars = (p['reviewerAvatars'] as List?)?.map((e) => e.toString()).toList() ??
        ['assets/profile-images/person2.png', 'assets/profile-images/person3.png', 'assets/profile-images/person4.png'];
    final gallery = (p['galleryImages'] as List?)?.map((e) => e.toString()).toList() ??
        ['assets/images/cook1.png', 'assets/images/cook2.png', 'assets/images/cook3.png'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHero(coverUrl, avatarUrl, isFullyBooked, name),
            const SizedBox(height: 48),

            _section(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Text(name, textAlign: TextAlign.center, style: const TextStyle(fontFamily: 'Gilroy-SemiBold', fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF1B1B1B), letterSpacing: -0.3))),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/location.svg', width: 14, height: 18, colorFilter: const ColorFilter.mode(Color(0xFF004E42), BlendMode.srcIn)),
                    const SizedBox(width: 4),
                    const Text('Office address:', style: TextStyle(fontFamily: 'Gilroy-Regular', fontSize: 14, height: 1.4, color: Color(0xFF004E42))),
                  ],
                ),
                const SizedBox(height: 4),
                Text(address, textAlign: TextAlign.center, style: const TextStyle(fontFamily: 'Gilroy-Regular', fontSize: 14, height: 1.4, color: Color(0xFF1B1B1B))),
              ],
            )),

            const SizedBox(height: 20),

            _section(child: Row(
              children: [
                Expanded(child: _statCard(rating.toStringAsFixed(1), 'Overall rating', svg: 'assets/icons/star.svg')),
                const SizedBox(width: 8),
                Expanded(child: _statCard('$totalBookings', 'Total Bookings')),
                const SizedBox(width: 8),
                Expanded(child: _statCard('$servicesCount', 'Services offered')),
              ],
            )),

            const SizedBox(height: 24),

            _section(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _heading('About me'),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: _ctrl.toggleAboutExpanded,
                  child: Obx(() => Text.rich(TextSpan(
                    text: about,
                    style: const TextStyle(fontFamily: 'Gilroy-Regular', fontSize: 14, height: 1.5, color: Color(0xFF393939)),
                    children: [
                      TextSpan(
                        text: _ctrl.isAboutExpanded.value ? ' (Tap to show less)' : ' Read more..',
                        style: const TextStyle(fontFamily: 'Gilroy-Regular', fontSize: 14, height: 1.5, color: Color(0xFF393939)),
                      ),
                    ],
                  ))),
                ),
              ],
            )),

            const SizedBox(height: 20),

            _section(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _heading('Services'),
                const SizedBox(height: 12),
                Obx(() => Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  children: services.map((s) {
                    final active = _ctrl.selectedService.value == s;
                    return InkWell(
                      onTap: () => _ctrl.selectService(s),
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: active ? const Color(0xFF004E42) : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: active ? const Color(0xFF004E42) : const Color(0xFF004E42).withValues(alpha: 0.4),
                          ),
                        ),
                        child: Text(s, style: TextStyle(fontFamily: 'Gilroy-Regular', fontSize: 14, height: 1.5, color: active ? Colors.white : const Color(0xFF004E42))),
                      ),
                    );
                  }).toList(),
                )),
                const SizedBox(height: 12),
                Obx(() {
                  final desc = descriptions[_ctrl.selectedService.value]?.toString() ?? about;
                  return Text(desc, style: const TextStyle(fontFamily: 'Gilroy-Regular', fontSize: 14, height: 1.5, color: Color(0xFF393939)));
                }),
              ],
            )),

            const SizedBox(height: 20),

            _section(child: _infoCard(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _heading('No of staffs'),
                const SizedBox(height: 4),
                Text('$staffCount staffs', style: const TextStyle(fontFamily: 'Gilroy-Regular', fontSize: 14, height: 1.4, color: Color(0xFF1B1B1B))),
              ],
            ))),

            const SizedBox(height: 14),

            _section(child: InkWell(
              onTap: () => _showReviews(totalReviews),
              borderRadius: BorderRadius.circular(8),
              child: _infoCard(child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _heading('Reviews'),
                      const SizedBox(height: 4),
                      Row(children: [
                        _ratingBadge(rating.toStringAsFixed(1)),
                        const SizedBox(width: 6),
                        Text('($totalReviews reviews)', style: const TextStyle(fontFamily: 'Gilroy-Regular', fontSize: 14, color: Color(0xFF1B1B1B))),
                      ]),
                    ],
                  ),
                  _avatarsWithArrow(avatars),
                ],
              )),
            )),

            const SizedBox(height: 24),

            _section(child: SeeAllRow(title: 'Photos & Videos', onSeeAll: () {})),
            const SizedBox(height: 12),
            _section(child: Row(
              children: [
                for (int i = 0; i < gallery.take(3).length; i++) ...[
                  if (i > 0) const SizedBox(width: 12),
                  Expanded(child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(height: 92, child: _image(gallery[i])),
                  )),
                ],
              ],
            )),

            const SizedBox(height: 24),

            _section(child: _heading('Certification')),
            const SizedBox(height: 12),
            _section(child: Row(
              children: [
                _certCard('assets/images/certificate1.png'),
                const SizedBox(width: 12),
                _certCard('assets/images/certificate2.png'),
              ],
            )),

            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => CustomBottomNavBar(
        currentIndex: navCtrl.currentIndex.value,
        onTap: (i) {
          navCtrl.changeIndex(i);
          Get.back();
        },
      )),
    );
  }

  Widget _section({required Widget child}) =>
      Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: child);

  Widget _heading(String text) => Text(text, style: const TextStyle(fontFamily: 'Gilroy-Medium', fontSize: 16, fontWeight: FontWeight.w400, height: 1.5, color: Color(0xFF1B1B1B)));

  Widget _infoCard({required Widget child}) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: const Color(0xFFDBDBDB)),
    ),
    child: child,
  );

  Widget _statCard(String value, String label, {String? svg}) => Container(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
    decoration: BoxDecoration(color: const Color(0xFFF8F3EC), borderRadius: BorderRadius.circular(8)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (svg != null) ...[SvgPicture.asset(svg, width: 14, height: 14), const SizedBox(width: 4)],
            Text(value, style: const TextStyle(fontFamily: 'Gilroy-Medium', fontSize: 14, height: 1.3, color: Color(0xFF1B1B1B))),
          ],
        ),
        const SizedBox(height: 4),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(fontFamily: 'Gilroy-Regular', fontSize: 14, height: 1.4, color: Color(0xFF393939))),
      ],
    ),
  );

  Widget _ratingBadge(String value) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), border: Border.all(color: const Color(0xFFE3E3E3))),
    child: Row(mainAxisSize: MainAxisSize.min, children: [
      SvgPicture.asset('assets/icons/star.svg', width: 14, height: 14),
      const SizedBox(width: 4),
      Text(value, style: const TextStyle(fontFamily: 'Gilroy-Medium', fontSize: 12, color: Color(0xFF1B1B1B))),
    ]),
  );

  Widget _image(String url) => url.startsWith('assets/')
      ? Image.asset(url, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(color: const Color(0xFFEBEBEB)))
      : Image.network(url, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(color: const Color(0xFFEBEBEB)));

  Widget _certCard(String url) => SizedBox(
    width: 112,
    height: 92,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: _image(url),
    ),
  );

  Widget _avatarsWithArrow(List<String> avatars) {
    final list = avatars.isNotEmpty ? avatars : [
      'assets/profile-images/person2.png',
      'assets/profile-images/person3.png',
      'assets/profile-images/person4.png',
    ];
    final count = list.length.clamp(0, 3);
    return SizedBox(
      width: 32.0 + count * 20.0,
      height: 32,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          for (int i = 0; i < count; i++)
            Positioned(
              left: i * 20.0,
              child: SizedBox(
                width: 32,
                height: 32,
                child: ClipOval(child: _image(list[i])),
              ),
            ),
          Positioned(
            left: count * 20.0,
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(color: Color(0xFFF1F1F1), shape: BoxShape.circle),
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/icons/arrow-right.svg', width: 14, height: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHero(String coverUrl, String avatarUrl, bool isFullyBooked, String name) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 156,
          width: double.infinity,
          child: Stack(fit: StackFit.expand, children: [
            _image(coverUrl),
            Container(color: const Color(0x80000000)),
          ]),
        ),
        Positioned(
          top: 58,
          left: 16,
          child: InkWell(
            onTap: Get.back,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(color: Color(0xFFF1F1F1), shape: BoxShape.circle),
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/icons/arrow-left.svg', width: 16, height: 16),
            ),
          ),
        ),
        if (isFullyBooked)
          Positioned(
            right: 16,
            bottom: 13,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(color: const Color(0xFFE5EDEC), borderRadius: BorderRadius.circular(20)),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                const Text('Fully booked', style: TextStyle(fontFamily: 'Gilroy-Regular', fontSize: 14, height: 1.4, color: Color(0xFF004E42))),
                const SizedBox(width: 4),
                Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0x4D004E42), shape: BoxShape.circle)),
              ]),
            ),
          ),
        Positioned(
          bottom: -40,
          left: 0,
          right: 0,
          child: Center(
            child: ClipOval(
              child: SizedBox(
                width: 80,
                height: 80,
                child: avatarUrl.startsWith('assets/')
                    ? Image.asset(avatarUrl, fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(color: const Color(0xFFD8D8D8), alignment: Alignment.center,
                          child: Text(name.isNotEmpty ? name[0] : 'J', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF004E42)))))
                    : Image.network(avatarUrl, fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(color: const Color(0xFFD8D8D8), alignment: Alignment.center,
                          child: Text(name.isNotEmpty ? name[0] : 'J', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF004E42))))),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showReviews(int totalReviews) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text('Reviews ($totalReviews)', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                IconButton(icon: const Icon(Icons.close_rounded), onPressed: Get.back),
              ]),
              const SizedBox(height: 12),
              _reviewTile('EM', 'Emily Watson', 'Outstanding service! Arrived right on time and cleaned thoroughly.', '5.0'),
              const Divider(),
              _reviewTile('AL', 'Alex Liam', 'Very polite and did an exceptional job with laundry and cooking.', '4.8', bgColor: AppColors.pastelGreenBg),
            ],
          ),
        ),
      ),
    );
  }

  Widget _reviewTile(String initials, String name, String review, String stars, {Color bgColor = AppColors.pastelIndigoBg}) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: bgColor, child: Text(initials, style: const TextStyle(color: AppColors.primaryTeal))),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(review),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), border: Border.all(color: const Color(0xFFE3E3E3))),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          SvgPicture.asset('assets/icons/star.svg', width: 14, height: 14),
          const SizedBox(width: 4),
          Text(stars, style: const TextStyle(fontFamily: 'Gilroy-Medium', fontSize: 12, color: Color(0xFF1B1B1B))),
        ]),
      ),
    );
  }
}
