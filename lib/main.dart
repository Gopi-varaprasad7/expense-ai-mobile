import 'package:fintraq/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FintraqApp());
}

class FintraqApp extends StatelessWidget {
  const FintraqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fintraq',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'DM Sans',
        colorScheme: ColorScheme.dark(
          primary: AppColors.green,
          surface: AppColors.surface,
          background: AppColors.background,
        ),
      ),
    );
  }
}
