import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final double width;

  const CategoryButton({
    super.key,
    required this.title,
    this.isSelected = false,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.background,
        borderRadius: BorderRadius.circular(20),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 18,
                  offset: const Offset(0, 10),
                )
              ]
            : [],
      ),
      child: Text(
        title,
        style: AppTextStyles.interText.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: isSelected ? AppColors.white : AppColors.textSecondary,
        ),
      ),
    );
  }
}
