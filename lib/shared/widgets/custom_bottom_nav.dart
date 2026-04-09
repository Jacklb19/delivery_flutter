import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/app_router.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNav({super.key, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.primary,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      padding: EdgeInsets.zero,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navItem(context, Icons.home_rounded, 0, AppRouter.homePath),
          _navItem(context, Icons.person_outline_rounded, 1, AppRouter.profilePath),
          const SizedBox(width: 48), // space for notch
          _navItem(context, Icons.chat_bubble_outline_rounded, 2, AppRouter.supportPath),
          _navItem(context, Icons.favorite_border_rounded, 3, AppRouter.homePath),
        ],
      ),
    );
  }

  Widget _navItem(BuildContext context, IconData icon, int index, String route) {
    final isActive = currentIndex == index;
    return GestureDetector(
      onTap: () => context.go(route),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: AppColors.white,
            size: 24,
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
