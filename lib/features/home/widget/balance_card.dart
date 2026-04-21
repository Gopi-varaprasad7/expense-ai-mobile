import 'package:fintraq/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double totalBalance;
  final double budget;
  final String currencySymbol;

  const BalanceCard({
    super.key,
    required this.totalBalance,
    required this.budget,
    required this.currencySymbol,
  });

  @override
  Widget build(BuildContext context) {
    // Progress calculation logic ఇక్కడికి మూవ్ అయింది
    final progress = (totalBalance / budget).clamp(0.0, 1.0);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0D2D1F), Color(0xFF0A1F14)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: AppColors.greenBorder),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.credit_card_outlined,
                color: AppColors.green,
                size: 14,
              ),
              const SizedBox(width: 6),
              const Text(
                'TOTAL BALANCE · THIS MONTH',
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$currencySymbol${totalBalance.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.green.withOpacity(0.15),
                  border: Border.all(color: AppColors.green.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '↗ 3597% vs last month',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.black26,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.green),
              minHeight: 5,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '₹0',
                style: TextStyle(color: AppColors.textMuted, fontSize: 10),
              ),
              Text(
                'Budget $currencySymbol${budget.toStringAsFixed(0)}',
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
