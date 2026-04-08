import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/size_config.dart';

class PopupMessage extends StatelessWidget {
  final VoidCallback onGoBack;

  const PopupMessage({super.key, required this.onGoBack});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SizeConfig.w(35)), // To match the overall app radius feel
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      width: SizeConfig.w(340),
      height: SizeConfig.h(400),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.white,
        borderRadius: BorderRadius.circular(SizeConfig.w(35)),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Icon Box
          Positioned(
            top: SizeConfig.h(26),
            child: Container(
              width: SizeConfig.w(90),
              height: SizeConfig.w(90),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: SizeConfig.w(60),
                  height: SizeConfig.w(60),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: AppColors.white, size: SizeConfig.w(30)),
                ),
              ),
            ),
          ),

          // Success Title
          Positioned(
            top: SizeConfig.h(144),
            child: Text(
              'Success !',
              style: AppTextStyles.robotoText.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.w(32), // large text
                color: AppColors.textPrimary,
              ),
            ),
          ),

          // Message
          Positioned(
            top: SizeConfig.h(195),
            child: SizedBox(
              width: SizeConfig.w(220), // approx to wrap like in figma
              child: Text(
                'Your payment was successful. A receipt for this purchase has been sent to your email.',
                textAlign: TextAlign.center,
                style: AppTextStyles.robotoText.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.w(16),
                  color: const Color(0xFF808080),
                  height: 1.5,
                ),
              ),
            ),
          ),

          // Button
          Positioned(
            bottom: SizeConfig.h(27),
            child: GestureDetector(
              onTap: onGoBack,
              child: Container(
                width: SizeConfig.w(220),
                height: SizeConfig.h(60),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                ),
                child: Center(
                  child: Text(
                    'Go Back',
                    style: AppTextStyles.robotoText.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.w(18),
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
