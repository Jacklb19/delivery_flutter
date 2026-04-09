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
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Background Gradient (top portion)
          Container(
            width: double.infinity,
            height: SizeConfig.h(280), // extend deeper to safely sit under the white sheet
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.splashGradientStart, AppColors.splashGradientEnd],
              ),
            ),
          ),
          SafeArea(
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
              ],
            ),
          ),
          // White Sheet
          Positioned(
            top: SizeConfig.h(161),
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SizeConfig.w(35)),
                  topRight: Radius.circular(SizeConfig.w(35)),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  top: SizeConfig.h(100), // make space for avatar
                  left: SizeConfig.w(17),
                  right: SizeConfig.w(17),
                  bottom: SizeConfig.h(30),
                ),
                child: Column(
                  children: [
                    _profileField('Name', 'Sophia Patel'),
                    SizedBox(height: SizeConfig.h(36)),
                    _profileField('Email', 'sophiapatel@gmail.com'),
                    SizedBox(height: SizeConfig.h(36)),
                    _profileField('Delivery address', '123 Main St Apartment 4A,New York, NY'),
                    SizedBox(height: SizeConfig.h(36)),
                    _profileField('Password', '••••••••••', hasLock: true),
                    SizedBox(height: SizeConfig.h(60)),
                    // Divider
                    const Divider(color: AppColors.dividerGrey, thickness: 1, height: 1),
                    SizedBox(height: SizeConfig.h(30)),
                    _menuItem('Payment Details'),
                    SizedBox(height: SizeConfig.h(24)),
                    _menuItem('Order history'),
                    SizedBox(height: SizeConfig.h(60)),
                    // Bottom buttons
                    Row(children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: SizeConfig.h(70),
                          decoration: BoxDecoration(
                            color: AppColors.textPrimary, // #3c2f2f
                            borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.2),
                                blurRadius: 30,
                                offset: const Offset(0, 9),
                              ),
                            ],
                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text('Edit Profile', style: AppTextStyles.robotoMedium.copyWith(fontSize: SizeConfig.w(18), color: AppColors.white)),
                            SizedBox(width: SizeConfig.w(8)),
                            Icon(Icons.edit, color: AppColors.white, size: SizeConfig.w(20)),
                          ]),
                        ),
                      ),
                      SizedBox(width: SizeConfig.w(22)),
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: SizeConfig.h(70),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                            border: Border.all(color: AppColors.primary, width: 3),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.2),
                                blurRadius: 30,
                                offset: const Offset(0, 9),
                              ),
                            ],
                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Text('Log out', style: AppTextStyles.robotoMedium.copyWith(fontSize: SizeConfig.w(18), color: AppColors.primary)),
                            SizedBox(width: SizeConfig.w(8)),
                            Icon(Icons.logout, color: AppColors.primary, size: SizeConfig.w(20)),
                          ]),
                        ),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
          // Profile photo OVERLAPPING
          Positioned(
            top: SizeConfig.h(85), // roughly intersecting the curved edge appropriately
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: SizeConfig.w(139),
                height: SizeConfig.w(139),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                  border: Border.all(color: AppColors.primary, width: 4),
                  color: AppColors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(SizeConfig.w(16)), // inner radius taking border width into account
                  child: Image.asset(
                    'assets/images/profile_avatar.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.background,
                      child: const Icon(Icons.person, size: 60),
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
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(30)),
          alignment: Alignment.centerLeft,
          child: Text(value, style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(18), color: AppColors.textPrimary)),
        ),
        Positioned(
          top: -SizeConfig.h(10),
          left: SizeConfig.w(30),
          child: Container(
            color: AppColors.white,
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(4)),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Text(label, style: AppTextStyles.robotoMedium.copyWith(fontSize: SizeConfig.w(16), color: AppColors.textSecondary)),
              if (hasLock) ...[
                SizedBox(width: SizeConfig.w(6)),
                Icon(Icons.lock_outline, size: SizeConfig.w(16), color: AppColors.textSecondary),
              ],
            ]),
          ),
        ),
      ],
    );
  }

  Widget _menuItem(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.robotoMedium.copyWith(fontSize: SizeConfig.w(18), color: AppColors.textSecondary)),
          Icon(Icons.chevron_right, size: SizeConfig.w(24), color: AppColors.textSecondary),
        ],
      ),
    );
  }
}
