import 'package:fintraq/core/constants/app_colors.dart';
import 'package:fintraq/features/home/widget/balance_card.dart';
import 'package:fintraq/features/home/widget/income_expense_row.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _isINR = true;

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
                  BalanceCard(
                    totalBalance: 5088.24,
                    budget: 8000.00,
                    currencySymbol: '',
                  ),
                  const SizedBox(height: 14),
                  IncomeExpenseRow(income: 20000, expense: 17000),
                  // const SizedBox(height: 14),
                  // _buildCategoryCard(),
                  // const SizedBox(height: 14),
                  // _buildRecentTransactions(),
                ],
              ),
            ),
          ),
          // Positioned(bottom: 0, left: 0, right: 0, child: _buildBottomNav()),
        ],
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.layers_rounded,
            color: AppColors.background,
            size: 18,
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Fintraq',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.3,
          ),
        ),
        const Spacer(),
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              _currencyBtn('USD', !_isINR),
              _currencyBtn('INR', _isINR),
            ],
          ),
        ),
        const SizedBox(width: 10),
        //Avatar
        Container(
          width: 34,
          height: 35,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.green, Color(0xFF00A86B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              _userName[0],
              style: TextStyle(
                color: AppColors.background,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _currencyBtn(String label, bool active) {
    return GestureDetector(
      onTap: () => setState(() => _isINR = label == 'INR'),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        decoration: BoxDecoration(
          color: active ? AppColors.green : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: active ? AppColors.background : AppColors.textSecondary,
            fontSize: 11,
            fontWeight: active ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildGreeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$_greeting,$_userName',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
        ),
        const SizedBox(height: 2),
        const Text(
          'Here is your snapshot',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }
}
