import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('Chats', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Coming soon', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
      ),
    );
  }
}
