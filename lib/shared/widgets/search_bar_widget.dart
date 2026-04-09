import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/size_config.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const CustomSearchBar({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search field
        Expanded(
          child: Container(
            height: SizeConfig.h(60),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(SizeConfig.w(20)),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.searchShadow,
                  blurRadius: 19,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                SizedBox(width: SizeConfig.w(20)),
                Icon(Icons.search, color: AppColors.textPrimary, size: SizeConfig.w(24)),
                SizedBox(width: SizeConfig.w(24)),
                Expanded(
                  child: TextField(
                    onChanged: onChanged,
                    style: AppTextStyles.robotoMedium.copyWith(
                      fontSize: SizeConfig.w(18),
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: AppTextStyles.robotoMedium.copyWith(
                        fontSize: SizeConfig.w(18),
                        color: AppColors.textPrimary,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: SizeConfig.w(13)),
        // Filter button
        Container(
          width: SizeConfig.w(60),
          height: SizeConfig.h(60),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(SizeConfig.w(20)),
          ),
          child: Icon(Icons.tune, color: AppColors.white, size: SizeConfig.w(24)),
        ),
      ],
    );
  }
}
