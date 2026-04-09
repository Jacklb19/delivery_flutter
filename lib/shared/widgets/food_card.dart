import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/size_config.dart';

class FoodCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String rating;
  final String imageUrl;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const FoodCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.imageUrl,
    this.onTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.w(185),
        height: SizeConfig.h(225),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(SizeConfig.w(20)),
          boxShadow: const [
            BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 17,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Food image
            Positioned(
              top: SizeConfig.h(5),
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  imageUrl,
                  width: SizeConfig.w(120),
                  height: SizeConfig.h(120),
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: SizeConfig.w(120),
                    height: SizeConfig.h(120),
                    color: AppColors.background,
                    child: const Icon(Icons.fastfood, size: 40),
                  ),
                ),
              ),
            ),
            // Title
            Positioned(
              top: SizeConfig.h(136),
              left: SizeConfig.w(11),
              right: SizeConfig.w(11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.robotoSemiBold.copyWith(
                      fontSize: SizeConfig.w(16),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: AppTextStyles.robotoRegular.copyWith(
                      fontSize: SizeConfig.w(16),
                    ),
                  ),
                ],
              ),
            ),
            // Star + Rating
            Positioned(
              bottom: SizeConfig.h(14),
              left: SizeConfig.w(11),
              child: Row(
                children: [
                  Icon(Icons.star, color: AppColors.starYellow, size: SizeConfig.w(16)),
                  SizedBox(width: SizeConfig.w(5)),
                  Text(
                    rating,
                    style: AppTextStyles.robotoMedium.copyWith(
                      fontSize: SizeConfig.w(16),
                    ),
                  ),
                ],
              ),
            ),
            // Heart icon
            Positioned(
              bottom: SizeConfig.h(14),
              right: SizeConfig.w(11),
              child: GestureDetector(
                onTap: onFavoriteTap,
                child: Icon(
                  Icons.favorite_border,
                  color: AppColors.textPrimary,
                  size: SizeConfig.w(24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
