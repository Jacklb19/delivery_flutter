import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/providers/cart_provider.dart';
import '../../../shared/widgets/popup_message.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  const PaymentScreen({super.key});
  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  int _selectedPayment = 0; // 0=credit, 1=debit
  bool _saveCard = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final cart = ref.read(cartProvider.notifier);
    final subtotal = cart.subtotal;
    final taxes = cart.taxes;
    final delivery = cart.deliveryFees;
    final total = cart.grandTotal;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Top bar
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(12), vertical: SizeConfig.h(8)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                GestureDetector(onTap: () => context.pop(), child: Icon(Icons.arrow_back, size: SizeConfig.w(28), color: AppColors.textPrimary)),
                Icon(Icons.search, size: SizeConfig.w(20), color: AppColors.textPrimary),
              ])),
            SizedBox(height: SizeConfig.h(20)),
            // Order summary title
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(20)),
              child: Text('Order summary', style: AppTextStyles.poppinsHeading.copyWith(fontSize: SizeConfig.w(22), fontWeight: FontWeight.w600))),
            SizedBox(height: SizeConfig.h(20)),
            // Order lines
            _summaryRow('Order', '\$${subtotal.toStringAsFixed(2)}'),
            SizedBox(height: SizeConfig.h(16)),
            _summaryRow('Taxes', '\$${taxes.toStringAsFixed(1)}'),
            SizedBox(height: SizeConfig.h(16)),
            _summaryRow('Delivery fees', '\$${delivery.toStringAsFixed(1)}'),
            SizedBox(height: SizeConfig.h(14)),
            // Divider
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(36)),
              child: const Divider(color: AppColors.dividerGrey)),
            SizedBox(height: SizeConfig.h(10)),
            _summaryRow('Total:', '\$${total.toStringAsFixed(2)}', isBold: true),
            SizedBox(height: SizeConfig.h(16)),
            _summaryRow('Estimated delivery time:', '15 - 30mins', isSmall: true),
            SizedBox(height: SizeConfig.h(40)),
            // Payment methods title
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
              child: Text('Payment methods', style: AppTextStyles.poppinsHeading.copyWith(fontSize: SizeConfig.w(22), fontWeight: FontWeight.w600))),
            SizedBox(height: SizeConfig.h(20)),
            // Credit card
            _paymentCard(
              index: 0,
              title: 'Credit card',
              subtitle: '5105 **** **** 0505',
              logoAsset: 'assets/images/mastercard_logo.png',
            ),
            SizedBox(height: SizeConfig.h(17)),
            // Debit card
            _paymentCard(
              index: 1,
              title: 'Debit card',
              subtitle: '3566 **** **** 0505',
              logoAsset: 'assets/images/visa_logo.png',
            ),
            SizedBox(height: SizeConfig.h(20)),
            // Save card checkbox
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => setState(() => _saveCard = !_saveCard),
                child: Row(children: [
                  Container(
                    width: SizeConfig.w(18),
                    height: SizeConfig.w(18),
                    decoration: BoxDecoration(
                      color: _saveCard ? AppColors.primary : AppColors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: _saveCard ? AppColors.primary : AppColors.dividerGrey),
                    ),
                    child: _saveCard ? Icon(Icons.check, size: SizeConfig.w(12), color: AppColors.white) : null,
                  ),
                  SizedBox(width: SizeConfig.w(8)),
                  Text(
                    'Save card details for future payments',
                    style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(14), color: AppColors.textSecondary),
                  ),
                ]),
              ),
            ),
            SizedBox(height: SizeConfig.h(80)),
            // Total price + Pay Now
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
              child: Row(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Total price', style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(14), color: AppColors.textSecondary)),
                  Text('\$${total.toStringAsFixed(2)}', style: AppTextStyles.poppinsBold.copyWith(fontSize: SizeConfig.w(28), color: AppColors.textPrimary)),
                ]),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    PopupMessage.show(context);
                    ref.read(cartProvider.notifier).clearCart();
                  },
                  child: Container(width: SizeConfig.w(209), height: SizeConfig.h(70),
                    decoration: BoxDecoration(color: AppColors.textPrimary, borderRadius: BorderRadius.circular(SizeConfig.w(20))),
                    alignment: Alignment.center,
                    child: Text('Pay Now', style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(18), color: AppColors.white)))),
              ])),
            SizedBox(height: SizeConfig.h(30)),
          ]),
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isBold = false, bool isSmall = false}) {
    final style = isBold
      ? AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(16))
      : isSmall
        ? AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(12), color: AppColors.textSecondary)
        : AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(16), color: AppColors.textSecondary);
    return Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(36)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: style),
        Text(value, style: style),
      ]));
  }

  Widget _paymentCard({
    required int index,
    required String title,
    required String subtitle,
    required String logoAsset,
  }) {
    final isSelected = _selectedPayment == index;
    final bgColor = isSelected ? AppColors.creditCardBg : AppColors.white;
    final textColor = isSelected ? AppColors.white : AppColors.textPrimary;
    return GestureDetector(
      onTap: () => setState(() => _selectedPayment = index),
      child: Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
        child: Container(height: SizeConfig.h(80),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(SizeConfig.w(15)),
            border: isSelected ? null : Border.all(color: AppColors.dividerGrey)),
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(15)),
          child: Row(children: [
            // Card logo
            Container(
              width: SizeConfig.w(64),
              height: SizeConfig.h(40),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white24 : AppColors.background,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(SizeConfig.w(6)),
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset(logoAsset),
              ),
            ),
            SizedBox(width: SizeConfig.w(20)),
            Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(title, style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(14), color: textColor)),
              SizedBox(height: SizeConfig.h(4)),
              Text(subtitle, style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(14), color: textColor.withValues(alpha: 0.7))),
            ]),
            const Spacer(),
            Icon(isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: textColor, size: SizeConfig.w(20)),
          ]))),
    );
  }
}
