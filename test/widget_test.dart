import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:fe_test_controlloops/main.dart';
import 'package:fe_test_controlloops/controllers/navigation_controller.dart';

void main() {
  testWidgets('App loads Home screen, verifies star.svg and bottom nav SVGs with GetX',
      (WidgetTester tester) async {
    Get.testMode = true;

    // Build app
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Verify key texts on Home Screen
    expect(find.text('Welcome,'), findsOneWidget);
    expect(find.text('Jane 👋'), findsOneWidget);
    expect(find.text('What service do\nyou need?'), findsOneWidget);
    expect(find.text('Services'), findsOneWidget);
    expect(find.text('Top providers'), findsOneWidget);

    // Verify Bottom Navigation Bar contains Home, Bookings, Chat, Profile
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Bookings'), findsOneWidget);
    expect(find.text('Chat'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);

    // Scroll down to check provider cards and rating star
    await tester.drag(find.byType(SingleChildScrollView), const Offset(0, -400));
    await tester.pumpAndSettle();

    expect(find.text('Sam Davies'), findsOneWidget);

    // Verify star SVGs are present in the widget tree
    final svgFinders = find.byType(SvgPicture);
    expect(svgFinders, findsWidgets);

    // Test GetX Tab Switching with instant response
    final navCtrl = Get.find<NavigationController>();
    expect(navCtrl.currentIndex.value, 0);

    // Tap Bookings tab
    await tester.tap(find.text('Bookings'));
    await tester.pump();
    expect(navCtrl.currentIndex.value, 1);
    expect(find.text('Bookings'), findsWidgets);

    // Tap Chat tab
    await tester.tap(find.text('Chat'));
    await tester.pump();
    expect(navCtrl.currentIndex.value, 2);
    expect(find.text('Chats'), findsOneWidget);

    // Tap Profile tab
    await tester.tap(find.text('Profile'));
    await tester.pump();
    expect(navCtrl.currentIndex.value, 3);
    expect(find.text('Profile'), findsWidgets);

    // Tap Home tab to return home
    await tester.tap(find.text('Home'));
    await tester.pump();
    expect(navCtrl.currentIndex.value, 0);
    expect(find.text('Jane 👋'), findsOneWidget);

    // Test Category tap opens ServiceCategoryScreen with category name heading
    await tester.tap(find.text('Cleaning'));
    await tester.pumpAndSettle();
    expect(find.text('Cleaning'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);

    // Verify back button pops back to Home
    final backFinder = find.byWidgetPredicate(
      (widget) =>
          widget is SvgPicture &&
          widget.bytesLoader.toString().contains('arrow-left.svg'),
    );
    expect(backFinder, findsOneWidget);
    await tester.tap(backFinder);
    await tester.pumpAndSettle();
    expect(find.text('Jane 👋'), findsOneWidget);
  });
}
