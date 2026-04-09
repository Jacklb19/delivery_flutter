import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/size_config.dart';
import '../../core/utils/app_router.dart';

class PopupMessage {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.white.withValues(alpha: 0.8),
      builder: (ctx) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: SizeConfig.w(340),
              height: SizeConfig.h(400),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.popupShadow,
                    blurRadius: 47,
                    offset: Offset(0, 19),
                    spreadRadius: -8,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.h(26)),
                  // Checkmark circle
                  Container(
                    width: SizeConfig.w(90),
                    height: SizeConfig.w(90),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: AppColors.white,
                      size: SizeConfig.w(40),
                    ),
                  ),
                  SizedBox(height: SizeConfig.h(28)),
                  // Success text
                  Text(
                    'Success !',
                    style: AppTextStyles.poppinsBold.copyWith(
                      fontSize: SizeConfig.w(30),
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: SizeConfig.h(6)),
                  // Description
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(70)),
                    child: Text(
                      'Your payment was successful. A receipt for this purchase has been sent to your email.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.robotoRegular.copyWith(
                        fontSize: SizeConfig.w(14),
                        color: AppColors.bodyGrey,
                        height: 1.32,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Go Back button
                  GestureDetector(
                    onTap: () {
                      Navigator.of(ctx).pop();
                      context.go(AppRouter.homePath);
                    },
                    child: Container(
                      width: SizeConfig.w(220),
                      height: SizeConfig.h(60),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(SizeConfig.w(15)),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Go Back',
                        style: AppTextStyles.robotoSemiBold.copyWith(
                          fontSize: SizeConfig.w(18),
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.h(27)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
