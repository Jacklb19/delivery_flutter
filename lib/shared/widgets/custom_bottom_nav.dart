import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/size_config.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNav({
    super.key,
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      height: SizeConfig.h(90),
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(Icons.home_filled, 0),
              _buildNavItem(Icons.person_outline, 1),
              SizedBox(width: SizeConfig.w(50)), // Space for center FAB
              _buildNavItem(Icons.chat_bubble_outline, 2),
              _buildNavItem(Icons.favorite_outline, 3),
            ],
          ),
          // Center floating fake button element corresponding to group 18 / eclipse 3 from figma
          Positioned(
            top: -SizeConfig.h(41), // 815 vs 856 = 41px difference
            child: Container(
              width: SizeConfig.w(82),
              height: SizeConfig.w(82),
              decoration: const BoxDecoration(
                color: AppColors.background,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: SizeConfig.w(72),
                  height: SizeConfig.w(72),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(Icons.add, color: AppColors.white, size: SizeConfig.w(32)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: SizeConfig.w(24),
          color: index == currentIndex ? AppColors.primary : AppColors.textPrimary,
        ),
        if (index == currentIndex)
          Container(
            margin: EdgeInsets.only(top: SizeConfig.h(5)),
            width: SizeConfig.w(4),
            height: SizeConfig.w(4),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
