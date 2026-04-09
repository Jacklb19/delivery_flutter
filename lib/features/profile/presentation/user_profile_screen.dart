import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/app_router.dart';
import '../../../core/utils/size_config.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // Red gradient header
          Container(
            width: double.infinity,
            height: SizeConfig.h(200),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.splashGradientStart, AppColors.splashGradientEnd],
              ),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    left: SizeConfig.w(15), top: SizeConfig.h(6),
                    child: GestureDetector(
                      onTap: () {
                        if (context.canPop()) {
                          context.pop();
                          return;
                        }
                        context.go(AppRouter.homePath);
                      },
                      child: Icon(Icons.arrow_back, size: SizeConfig.w(28), color: AppColors.white),
                    ),
                  ),
                  Positioned(
                    right: SizeConfig.w(15), top: SizeConfig.h(6),
                    child: Icon(Icons.settings, size: SizeConfig.w(24), color: AppColors.white),
                  ),
                  // Profile photo
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Transform.translate(
                      offset: Offset(0, SizeConfig.h(40)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                        child: Image.asset(
                          'assets/images/profile_avatar.png',
                          width: SizeConfig.w(139),
                          height: SizeConfig.w(139),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            width: SizeConfig.w(139), height: SizeConfig.w(139),
                            color: AppColors.background,
                            child: const Icon(Icons.person, size: 60),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: SizeConfig.h(65)),
          // Form fields
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(17)),
              child: Column(
                children: [
                  _profileField('Name', 'Sophia Patel'),
                  SizedBox(height: SizeConfig.h(16)),
                  _profileField('Email', 'sophiapatel@gmail.com'),
                  SizedBox(height: SizeConfig.h(16)),
                  _profileField('Delivery address', '123 Main St Apartment 4A,New York, NY'),
                  SizedBox(height: SizeConfig.h(16)),
                  _profileField('Password', '••••••••••', hasLock: true),
                  SizedBox(height: SizeConfig.h(30)),
                  // Divider
                  const Divider(color: AppColors.dividerGrey),
                  SizedBox(height: SizeConfig.h(14)),
                  _menuItem('Payment Details'),
                  SizedBox(height: SizeConfig.h(10)),
                  _menuItem('Order history'),
                  SizedBox(height: SizeConfig.h(40)),
                  // Bottom buttons
                  Row(children: [
                    Expanded(
                      child: Container(
                        height: SizeConfig.h(70),
                        decoration: BoxDecoration(
                          color: AppColors.textPrimary,
                          borderRadius: BorderRadius.circular(SizeConfig.w(15)),
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Text('Edit Profile', style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(16), color: AppColors.white)),
                          SizedBox(width: SizeConfig.w(8)),
                          Icon(Icons.edit, color: AppColors.white, size: SizeConfig.w(20)),
                        ]),
                      ),
                    ),
                    SizedBox(width: SizeConfig.w(22)),
                    Expanded(
                      child: Container(
                        height: SizeConfig.h(70),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(SizeConfig.w(15)),
                          border: Border.all(color: AppColors.primary),
                        ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Text('Log out', style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(16), color: AppColors.primary)),
                          SizedBox(width: SizeConfig.w(8)),
                          Icon(Icons.logout, color: AppColors.primary, size: SizeConfig.w(20)),
                        ]),
                      ),
                    ),
                  ]),
                  SizedBox(height: SizeConfig.h(30)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileField(String label, String value, {bool hasLock = false}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: SizeConfig.h(60),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.w(15)),
            border: Border.all(color: AppColors.dividerGrey),
          ),
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(17)),
          alignment: Alignment.centerLeft,
          child: Text(value, style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(16))),
        ),
        Positioned(
          top: -SizeConfig.h(10),
          left: SizeConfig.w(20),
          child: Container(
            color: AppColors.white,
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(4)),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Text(label, style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(14), color: AppColors.textSecondary)),
              if (hasLock) ...[
                SizedBox(width: SizeConfig.w(4)),
                Icon(Icons.lock, size: SizeConfig.w(12), color: AppColors.textSecondary),
              ],
            ]),
          ),
        ),
      ],
    );
  }

  Widget _menuItem(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(18))),
        Icon(Icons.chevron_right, size: SizeConfig.w(24), color: AppColors.textSecondary),
      ],
    );
  }
}
