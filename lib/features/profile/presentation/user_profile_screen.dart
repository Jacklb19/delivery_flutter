import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Top Red Area
          Container(
            height: SizeConfig.h(200), // Approximate to go under the white card
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF2A9D), AppColors.primary],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          
          SafeArea(
            child: Stack(
              children: [
                // Top Bar
                Positioned(
                  left: SizeConfig.w(15),
                  top: SizeConfig.h(10), // adjusting for SafeArea
                  child: GestureDetector(
                    onTap: () => context.pop(),
                    child: Container(
                      width: SizeConfig.w(28),
                      height: SizeConfig.h(28),
                      alignment: Alignment.center,
                      child: const Icon(Icons.arrow_back, color: AppColors.white),
                    ),
                  ),
                ),
                Positioned(
                  right: SizeConfig.w(20),
                  top: SizeConfig.h(10),
                  child: Icon(Icons.settings, size: SizeConfig.w(24), color: AppColors.white),
                ),
              ],
            ),
          ),

          // Main White Card
          Positioned(
            top: SizeConfig.h(161),
            bottom: 0,
            left: 0,
            right: 0,
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
                  top: SizeConfig.h(85), // space for overlapping image
                  bottom: SizeConfig.h(120),
                  left: SizeConfig.w(17),
                  right: SizeConfig.w(17),
                ),
                child: Column(
                  children: [
                    _buildFieldRow('Name', 'Sophia Patel'),
                    SizedBox(height: SizeConfig.h(25)),
                    _buildFieldRow('Email', 'sophiapatel@gmail.com'),
                    SizedBox(height: SizeConfig.h(25)),
                    _buildFieldRow('Delivery address', '123 Main St Apartment 4A,New York, NY'),
                    SizedBox(height: SizeConfig.h(25)),
                    _buildFieldRow('Password', '********', isPassword: true),
                    
                    SizedBox(height: SizeConfig.h(83)),

                    _buildArrowButtonRow('Payment Details'),
                    SizedBox(height: SizeConfig.h(20)),
                    _buildArrowButtonRow('Order history'),

                    SizedBox(height: SizeConfig.h(40)),
                  ],
                ),
              ),
            ),
          ),

          // Overlapping Profile Image
          Positioned(
            top: SizeConfig.h(68),
            left: SizeConfig.w(146),
            child: Container(
              width: SizeConfig.w(139),
              height: SizeConfig.w(139),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary, width: 4),
                image: const DecorationImage(
                  image: NetworkImage('https://placehold.co/139x139/png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Bottom Buttons
          Positioned(
            bottom: SizeConfig.h(35),
            left: SizeConfig.w(19),
            child: Container(
              width: SizeConfig.w(195),
              height: SizeConfig.h(70),
              decoration: BoxDecoration(
                color: AppColors.textPrimary,
                borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                boxShadow: [
                  BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 30, offset: const Offset(0, 9)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Edit Profile', style: AppTextStyles.robotoText.copyWith(color: AppColors.white, fontWeight: FontWeight.w500, fontSize: SizeConfig.w(18))),
                  SizedBox(width: SizeConfig.w(10)),
                  Icon(Icons.edit, color: AppColors.white, size: SizeConfig.w(20)),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: SizeConfig.h(35),
            right: SizeConfig.w(19),
            child: Container(
              width: SizeConfig.w(175),
              height: SizeConfig.h(70),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.primary, width: 3),
                borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                boxShadow: [
                  BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 30, offset: const Offset(0, 9)),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Log out', style: AppTextStyles.robotoText.copyWith(color: AppColors.primary, fontWeight: FontWeight.w500, fontSize: SizeConfig.w(18))),
                  SizedBox(width: SizeConfig.w(10)),
                  Icon(Icons.logout, color: AppColors.primary, size: SizeConfig.w(20)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldRow(String label, String value, {bool isPassword = false}) {
    return Container(
      width: SizeConfig.w(395),
      height: SizeConfig.h(60),
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(20)),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(SizeConfig.w(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: AppTextStyles.robotoText.copyWith(
              color: const Color(0xFF808080),
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.w(16),
            ),
          ),
          SizedBox(width: SizeConfig.w(15)),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.robotoText.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.w(18),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (isPassword)
            Icon(Icons.lock, color: AppColors.textPrimary, size: SizeConfig.w(15)),
        ],
      ),
    );
  }

  Widget _buildArrowButtonRow(String label) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(29)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.robotoText.copyWith(
              color: const Color(0xFF808080),
              fontWeight: FontWeight.w500,
              fontSize: SizeConfig.w(18),
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: SizeConfig.w(16), color: const Color(0xFF808080)),
        ],
      ),
    );
  }
}
