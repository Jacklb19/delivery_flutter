import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/app_router.dart';

class Product5Screen extends StatelessWidget {
  const Product5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Top Bar
            Positioned(
              left: SizeConfig.w(12),
              top: SizeConfig.h(22),
              child: GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  width: SizeConfig.w(28),
                  height: SizeConfig.h(28),
                  alignment: Alignment.center,
                  child: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
                ),
              ),
            ),
            Positioned(
              right: SizeConfig.w(19),
              top: SizeConfig.h(28),
              child: Icon(Icons.search, size: SizeConfig.w(20), color: AppColors.textPrimary),
            ),

            // Left Side Big Image (Burger sticking out)
            Positioned(
              top: SizeConfig.h(109),
              left: SizeConfig.w(-26),
              width: SizeConfig.w(217),
              height: SizeConfig.h(297),
              child: Image.network(
                'https://placehold.co/217x297/png',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(color: Colors.grey.withOpacity(0.2)),
              ),
            ),

            // Main Text
            Positioned(
              top: SizeConfig.h(94),
              left: SizeConfig.w(249),
              width: SizeConfig.w(162),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Customize\n",
                      style: AppTextStyles.robotoText.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: SizeConfig.w(16),
                        height: 1.8,
                      ),
                    ),
                    TextSpan(
                      text: "Your Burger to Your Tastes. Ultimate Experience",
                      style: AppTextStyles.robotoText.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: SizeConfig.w(14),
                        height: 1.8,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Spicy Section
            Positioned(
              top: SizeConfig.h(206),
              left: SizeConfig.w(249),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Spicy',
                    style: AppTextStyles.robotoText.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.w(14),
                    ),
                  ),
                  SizedBox(height: SizeConfig.h(16)),
                  Container(
                    width: SizeConfig.w(156),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Container(
                          height: SizeConfig.h(10),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          height: SizeConfig.h(10),
                          width: SizeConfig.w(60),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.h(8)),
                  Container(
                    width: SizeConfig.w(156),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Mild',
                          style: AppTextStyles.robotoText.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.w(12),
                            color: const Color(0xFF1CC019),
                          ),
                        ),
                        Text(
                          'Hot',
                          style: AppTextStyles.robotoText.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.w(12),
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Portion Section
            Positioned(
              top: SizeConfig.h(327),
              left: SizeConfig.w(249),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Portion',
                    style: AppTextStyles.robotoText.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.w(14),
                    ),
                  ),
                  SizedBox(height: SizeConfig.h(10)),
                  Row(
                    children: [
                      Container(
                        width: SizeConfig.w(40),
                        height: SizeConfig.w(40),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.remove, size: SizeConfig.w(20)),
                      ),
                      SizedBox(width: SizeConfig.w(15)),
                      Text(
                        '2',
                        style: AppTextStyles.interText.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: SizeConfig.w(18),
                        ),
                      ),
                      SizedBox(width: SizeConfig.w(15)),
                      Container(
                        width: SizeConfig.w(40),
                        height: SizeConfig.w(40),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              blurRadius: 13,
                              offset: const Offset(0, 7),
                            ),
                          ],
                        ),
                        child: Icon(Icons.add, color: AppColors.white, size: SizeConfig.w(20)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Toppings Header
            Positioned(
              top: SizeConfig.h(451),
              left: SizeConfig.w(19),
              child: Text(
                'Toppings',
                style: AppTextStyles.robotoText.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.w(18),
                ),
              ),
            ),

            // Toppings Scroll Row (Tomato, Onions, Pickles, Bacons, Cheese, Mushroom, Avocado)
            // Wait, Figma has Toppings and Side options flipped? Let's follow Figma EXACTLY exactly as it was output:
            // "Toppings" is at 451. The row under it is at 484. The items at 484 are: Tomato, Onions, Pickles, Bacons, Cheese, Mushroom, Avocado.
            Positioned(
              top: SizeConfig.h(484),
              left: 0,
              width: SizeConfig.screenWidth,
              height: SizeConfig.h(99),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(20)),
                child: Row(
                  children: [
                    _buildOptionCard(title: 'Tomato', isSelected: true),
                    _buildOptionCard(title: 'Onions', isSelected: false),
                    _buildOptionCard(title: 'Pickles', isSelected: false),
                    _buildOptionCard(title: 'Bacons', isSelected: true),
                    _buildOptionCard(title: 'Cheese', isSelected: false),
                    _buildOptionCard(title: 'Mushroom', isSelected: false),
                    _buildOptionCard(title: 'Avocado', isSelected: false),
                  ],
                ),
              ),
            ),

            // Side Options Header
            Positioned(
              top: SizeConfig.h(613),
              left: SizeConfig.w(19),
              child: Text(
                'Side options',
                style: AppTextStyles.robotoText.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.w(18),
                ),
              ),
            ),

            // Side Options Scroll Row (Fries, Coleslaw, Salad, Onion, Mozzarella)
            // Starts at 646. Height 116.
            Positioned(
              top: SizeConfig.h(646),
              left: 0,
              width: SizeConfig.screenWidth,
              height: SizeConfig.h(116),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(20)),
                child: Row(
                  children: [
                    _buildOptionCard(title: 'Fries', height: 116),
                    _buildOptionCard(title: 'Coleslaw', height: 116),
                    _buildOptionCard(title: 'Salad', height: 116),
                    _buildOptionCard(title: 'Onion', height: 116),
                    _buildOptionCard(title: 'Mozzarella', height: 116),
                  ],
                ),
              ),
            ),

            // Bottom Section (Price and Order Button)
            Positioned(
              top: SizeConfig.h(826),
              left: SizeConfig.w(19),
              child: Text(
                'Total',
                style: AppTextStyles.robotoText.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.w(18),
                ),
              ),
            ),
            Positioned(
              top: SizeConfig.h(855),
              left: SizeConfig.w(19),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "\$",
                      style: AppTextStyles.robotoText.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.w(24),
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: "16.49",
                      style: AppTextStyles.robotoText.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.w(36),
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Order Button
            Positioned(
              top: SizeConfig.h(827),
              left: SizeConfig.w(211),
              child: GestureDetector(
                onTap: () => context.push(AppRouter.paymentPath),
                child: Container(
                  width: SizeConfig.w(200),
                  height: SizeConfig.h(70),
                  alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                ),
                child: Text(
                  'ORDER NOW',
                  style: AppTextStyles.interText.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.w(18),
                    color: AppColors.white,
                  ),
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionCard({required String title, bool isSelected = false, double height = 99}) {
    return Container(
      width: SizeConfig.w(84),
      height: SizeConfig.h(height),
      margin: EdgeInsets.only(right: SizeConfig.w(30)), // gap is 30 in figma
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Background
          Positioned(
            bottom: 0,
            child: Container(
              width: SizeConfig.w(84),
              height: SizeConfig.h(height - (height == 116 ? 47 : 30)),
              decoration: BoxDecoration(
                color: AppColors.textPrimary,
                borderRadius: BorderRadius.circular(SizeConfig.w(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
            ),
          ),
          // Background for selected or unselected top part? Actually Figma has two rectangles overlapping. 
          // The background of the white card where the image sits is: w 84, h 78 for side options (total 116) or 61 for toppings (total 99)
          Positioned(
            top: 0,
            child: Container(
              width: SizeConfig.w(84),
              height: SizeConfig.h(height == 116 ? 78 : 61),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(SizeConfig.w(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.h(10)),
                  child: Image.network('https://placehold.co/40x40/png', width: SizeConfig.w(40)),
                ),
              ),
            ),
          ),
          // Text and Icon at the bottom
          Positioned(
            bottom: SizeConfig.h(height == 116 ? 13 : 13), // approx 13 from bottom
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: AppTextStyles.robotoText.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.w(12),
                    color: AppColors.white,
                  ),
                ),
                SizedBox(width: SizeConfig.w(4)),
                // checkbox icon if selected (we can mock it with an icon)
                if (isSelected) 
                  Icon(Icons.check_circle, size: SizeConfig.w(12), color: Colors.amber) // Mocking the selection icon
                else
                  Icon(Icons.add_circle_outline, size: SizeConfig.w(12), color: AppColors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
