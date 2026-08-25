import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'controllers/navigation_controller.dart';
import 'controllers/provider_controller.dart';
import 'screens/home_screen.dart';
import 'theme/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Service Booking',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      transitionDuration: Duration.zero,
      initialBinding: BindingsBuilder(() {
        Get.put(NavigationController(), permanent: true);
        Get.put(ProviderController(), permanent: true);
      }),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryTeal),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
