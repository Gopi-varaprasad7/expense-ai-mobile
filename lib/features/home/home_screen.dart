import 'package:fintraq/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool is_INR = true;

  //sample data
  final double _totalBalance = 5088.24;
  final double _income = 8000.00;
  final double _expenses = 2911.76;
  final double _budget = 8000.00;
  final String _userName = 'Rahul';

  String get _greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 120),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTopBar(),
                  const SizedBox(height: 20),
                  _buildGreeting(),
                  const SizedBox(height: 16),
                  _buildBalanceCard(),
                  const SizedBox(height: 14),
                  _buildIncomeExpenseRow(),
                  const SizedBox(height: 14),
                  _buildCategoryCard(),
                  const SizedBox(height: 14),
                  _buildRecentTransactions(),
                ],
              ),
            ),
          ),
          Positioned(bottom: 0, left: 0, right: 0, child: _buildBottomNav()),
        ],
      ),
    );
  }
}
