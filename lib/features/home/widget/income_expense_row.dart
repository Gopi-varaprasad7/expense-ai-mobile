import 'package:fintraq/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class IncomeExpenseRow extends StatelessWidget {
  final double income;
  final double expense;
  const IncomeExpenseRow({
    super.key,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            label: 'INCOME',
            amount: income,
            isIncome: true,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            label: 'EXPENSES',
            amount: expense,
            isIncome: false,
          ),
        ),
      ],
    );
  }
}

Widget _buildStatCard({
  required String label,
  required double amount,
  required bool isIncome,
}) {
  final color = isIncome ? AppColors.green : AppColors.red;
  final bgColor = isIncome ? AppColors.greenDark : AppColors.redDark;
  final borderColor = isIncome ? AppColors.greenBorder : AppColors.redBorder;
  final arrow = isIncome ? '↙' : '↗';

  var currencySymbol;
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: bgColor,
      border: Border.all(color: borderColor),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 10,
                letterSpacing: 1,
              ),
            ),
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  arrow,
                  style: TextStyle(color: color, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          '$currencySymbol${amount.toStringAsFixed(2)}',
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
        ),
      ],
    ),
  );
}
