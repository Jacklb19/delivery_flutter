import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.lobsterDisplay.copyWith(fontSize: 60),
        displayMedium: AppTextStyles.lobsterDisplay.copyWith(fontSize: 45),
        bodyLarge: AppTextStyles.robotoText.copyWith(fontSize: 18),
        bodyMedium: AppTextStyles.robotoText.copyWith(fontSize: 16),
      ),
    );
  }
}
