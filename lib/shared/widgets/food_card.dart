import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/size_config.dart';

class FoodCard extends StatelessWidget {
  final String titlePart1;
  final String titlePart2;
  final String rating;
  final String imageUrl;
  final VoidCallback onTap;

  const FoodCard({
    super.key,
    required this.titlePart1,
    required this.titlePart2,
    required this.rating,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SizeConfig.w(185),
        height: SizeConfig.h(225),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(SizeConfig.w(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.13),
              blurRadius: 17,
              offset: Offset(0, SizeConfig.h(6)),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Shadow under burger
            Positioned(
              top: SizeConfig.h(109),
              left: SizeConfig.w(47),
              child: Container(
                width: SizeConfig.w(91),
                height: SizeConfig.h(11),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            // Image
            Positioned(
              top: SizeConfig.h(5),
              left: SizeConfig.w(32),
              width: SizeConfig.w(120),
              height: SizeConfig.h(122),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(color: Colors.grey.withOpacity(0.3)),
              ),
            ),
            // Title
            Positioned(
              top: SizeConfig.h(136),
              left: SizeConfig.w(11),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titlePart1,
                    style: AppTextStyles.robotoText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.w(16),
                    ),
                  ),
                  Text(
                    titlePart2,
                    style: AppTextStyles.robotoText.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.w(16),
                    ),
                  ),
                ],
              ),
            ),
            // Rating
            Positioned(
              bottom: SizeConfig.h(15),
              left: SizeConfig.w(11),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: SizeConfig.w(16)),
                  SizedBox(width: SizeConfig.w(5)),
                  Text(
                    rating,
                    style: AppTextStyles.robotoText.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.w(16),
                    ),
                  ),
                ],
              ),
            ),
            // Favorite 
            Positioned(
              bottom: SizeConfig.h(12),
              right: SizeConfig.w(12),
              child: Icon(
                Icons.favorite_outline, 
                color: AppColors.textPrimary, 
                size: SizeConfig.w(24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
