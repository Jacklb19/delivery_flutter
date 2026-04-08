import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/app_router.dart';

class Product2Screen extends StatelessWidget {
  const Product2Screen({super.key});

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

            // Image
            Positioned(
              top: SizeConfig.h(36),
              left: SizeConfig.w(40),
              width: SizeConfig.w(350),
              height: SizeConfig.h(355),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: SizeConfig.h(10)),
                    width: SizeConfig.w(268),
                    height: SizeConfig.h(28),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Image.network(
                    'https://placehold.co/350x355/png',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            // Title
            Positioned(
              top: SizeConfig.h(442),
              left: SizeConfig.w(19),
              child: Text(
                "Hamburger Veggie Burger",
                style: AppTextStyles.robotoText.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.w(25),
                  height: 1.0,
                ),
              ),
            ),

            // Rating and Time
            Positioned(
              top: SizeConfig.h(485),
              left: SizeConfig.w(19),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: SizeConfig.w(16)),
                  SizedBox(width: SizeConfig.w(5)),
                  Text(
                    '4.8',
                    style: AppTextStyles.robotoText.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.w(15),
                      color: const Color(0xFF808080),
                    ),
                  ),
                  SizedBox(width: SizeConfig.w(15)),
                  Text(
                    '-',
                    style: TextStyle(color: const Color(0xFF808080), fontSize: SizeConfig.w(15)),
                  ),
                  SizedBox(width: SizeConfig.w(15)),
                  Text(
                    '14 mins',
                    style: AppTextStyles.robotoText.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.w(15),
                      color: const Color(0xFF808080),
                    ),
                  ),
                ],
              ),
            ),

            // Description
            Positioned(
              top: SizeConfig.h(524),
              left: SizeConfig.w(19),
              width: SizeConfig.w(392),
              child: Text(
                "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun.",
                style: AppTextStyles.robotoText.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.w(16),
                  color: AppColors.textSecondary,
                  height: 1.46,
                ),
              ),
            ),

            // Spicy Section
            Positioned(
              top: SizeConfig.h(688),
              left: SizeConfig.w(19),
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
                    width: SizeConfig.w(165),
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
                    width: SizeConfig.w(165),
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
              top: SizeConfig.h(688),
              left: SizeConfig.w(290),
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
                        '1',
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

            // Price Frame
            Positioned(
              top: SizeConfig.h(828),
              left: SizeConfig.w(19),
              child: Container(
                width: SizeConfig.w(104),
                height: SizeConfig.h(70),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 30,
                      offset: const Offset(0, 9),
                    ),
                  ],
                ),
                child: Text(
                  '\$9.99',
                  style: AppTextStyles.robotoText.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.w(22),
                    color: AppColors.white,
                  ),
                ),
              ),
            ),

            // Order Now Button
            Positioned(
              top: SizeConfig.h(828),
              left: SizeConfig.w(172),
              child: GestureDetector(
                onTap: () => context.push(AppRouter.paymentPath),
                child: Container(
                  width: SizeConfig.w(239),
                  height: SizeConfig.h(70),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.textPrimary,
                    borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 30,
                        offset: const Offset(0, 9),
                      ),
                    ],
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
}
