import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/app_router.dart';
import '../../../shared/widgets/popup_message.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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

            // Order Summary Title
            Positioned(
              top: SizeConfig.h(81),
              left: SizeConfig.w(20),
              child: Text(
                'Order summary',
                style: AppTextStyles.poppinsHeading.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.w(20),
                ),
              ),
            ),

            // Details list
            _buildOrderRow('Order', '\$16.48', SizeConfig.h(131)),
            _buildOrderRow('Taxes', '\$0.3', SizeConfig.h(168)),
            _buildOrderRow('Delivery fees', '\$1.5', SizeConfig.h(205)),

            // Divider
            Positioned(
              top: SizeConfig.h(240.5),
              left: SizeConfig.w(36),
              width: SizeConfig.w(355),
              child: Container(
                height: 1,
                color: const Color(0xFFE5E5E5), // Approximate line color
              ),
            ),

            // Total
            Positioned(
              top: SizeConfig.h(265),
              left: SizeConfig.w(36),
              width: SizeConfig.w(355),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: AppTextStyles.robotoText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.w(18),
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    '\$18.19',
                    style: AppTextStyles.robotoText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.w(18),
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),

            // Estimated Delivery Time
            Positioned(
              top: SizeConfig.h(312),
              left: SizeConfig.w(36),
              width: SizeConfig.w(355),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Estimated delivery time:',
                    style: AppTextStyles.robotoText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.w(14),
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    '15 - 30mins',
                    style: AppTextStyles.robotoText.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.w(14),
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),

            // Payment Methods Title
            Positioned(
              top: SizeConfig.h(395),
              left: SizeConfig.w(19),
              child: Text(
                'Payment methods',
                style: AppTextStyles.poppinsHeading.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConfig.w(20),
                ),
              ),
            ),

            // Credit Card Box
            Positioned(
              top: SizeConfig.h(447),
              left: SizeConfig.w(19),
              width: SizeConfig.w(392),
              child: Container(
                height: SizeConfig.h(80),
                decoration: BoxDecoration(
                  color: AppColors.textPrimary,
                  borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                ),
                child: Row(
                  children: [
                    SizedBox(width: SizeConfig.w(34)),
                    // Fake card image slot
                    Container(
                      width: SizeConfig.w(70),
                      height: SizeConfig.h(42),
                      color: Colors.white24, // placeholder 
                    ),
                    SizedBox(width: SizeConfig.w(31)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Credit card',
                          style: AppTextStyles.robotoText.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.w(14),
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: SizeConfig.h(4)),
                        Text(
                          '5105 **** **** 0505',
                          style: AppTextStyles.robotoText.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.w(14),
                            color: const Color(0xFF808080),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: SizeConfig.w(20),
                      height: SizeConfig.w(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          width: SizeConfig.w(10),
                          height: SizeConfig.w(10),
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: SizeConfig.w(20)),
                  ],
                ),
              ),
            ),

            // Debit Card Box
            Positioned(
              top: SizeConfig.h(554),
              left: SizeConfig.w(19),
              width: SizeConfig.w(392),
              child: Container(
                height: SizeConfig.h(80),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(width: SizeConfig.w(34)),
                    // Fake card image slot
                    Container(
                      width: SizeConfig.w(83),
                      height: SizeConfig.h(33),
                      color: Colors.grey.shade300, // placeholder
                    ),
                    SizedBox(width: SizeConfig.w(18)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Debit card',
                          style: AppTextStyles.robotoText.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.w(14),
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: SizeConfig.h(4)),
                        Text(
                          '3566 **** **** 0505',
                          style: AppTextStyles.robotoText.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.w(14),
                            color: const Color(0xFF808080),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: SizeConfig.w(20),
                      height: SizeConfig.w(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFD4D4D4), width: 2),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: SizeConfig.w(20)),
                  ],
                ),
              ),
            ),

            // Save details checkbox
            Positioned(
              top: SizeConfig.h(676),
              left: SizeConfig.w(19),
              child: Row(
                children: [
                  Container(
                    width: SizeConfig.w(18),
                    height: SizeConfig.w(18),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(Icons.check, color: AppColors.white, size: SizeConfig.w(12)),
                  ),
                  SizedBox(width: SizeConfig.w(9)),
                  Text(
                    'Save card details for future payments',
                    style: AppTextStyles.robotoText.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.w(16),
                      color: const Color(0xFF808080),
                    ),
                  ),
                ],
              ),
            ),

            // Total Bottom
            Positioned(
              top: SizeConfig.h(835),
              left: SizeConfig.w(19),
              child: Text(
                'Total price',
                style: AppTextStyles.robotoText.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.w(16),
                  color: const Color(0xFF808080),
                ),
              ),
            ),
            Positioned(
              top: SizeConfig.h(858),
              left: SizeConfig.w(19),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "\$",
                      style: AppTextStyles.robotoText.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.w(32),
                        color: AppColors.primary,
                      ),
                    ),
                    TextSpan(
                      text: "18.19",
                      style: AppTextStyles.robotoText.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.w(32),
                        color: AppColors.textPrimary,
                        height: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Pay Now Button
            Positioned(
              top: SizeConfig.h(826),
              left: SizeConfig.w(202),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => PopupMessage(
                      onGoBack: () {
                        context.pop();
                        context.go(AppRouter.homePath);
                      },
                    ),
                  );
                },
                child: Container(
                width: SizeConfig.w(209),
                height: SizeConfig.h(70),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.textPrimary,
                  borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                ),
                child: Text(
                  'Pay Now',
                  style: AppTextStyles.robotoText.copyWith(
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

  Widget _buildOrderRow(String label, String value, double topPos) {
    return Positioned(
      top: topPos,
      left: SizeConfig.w(36),
      width: SizeConfig.w(355),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.robotoText.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: SizeConfig.w(18),
              color: const Color(0xFF7D7D7D),
            ),
          ),
          Text(
            value,
            style: AppTextStyles.robotoText.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: SizeConfig.w(18),
              color: const Color(0xFF7D7D7D),
            ),
          ),
        ],
      ),
    );
  }
}
