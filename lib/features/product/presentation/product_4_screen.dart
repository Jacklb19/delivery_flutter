import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/utils/app_router.dart';
import '../../../core/providers/cart_provider.dart';

class Product4Screen extends ConsumerStatefulWidget {
  const Product4Screen({super.key});
  @override
  ConsumerState<Product4Screen> createState() => _Product4ScreenState();
}

class _Product4ScreenState extends ConsumerState<Product4Screen> {
  int _quantity = 4;
  double _spiceLevel = 0.5;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(12), vertical: SizeConfig.h(8)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                GestureDetector(onTap: () => context.pop(), child: Icon(Icons.arrow_back, size: SizeConfig.w(28), color: AppColors.textPrimary)),
                Icon(Icons.search, size: SizeConfig.w(20), color: AppColors.textPrimary),
              ])),
            Center(child: Image.asset('assets/images/burger_4.png', width: SizeConfig.w(360), height: SizeConfig.h(278), fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(width: SizeConfig.w(360), height: SizeConfig.h(278), color: AppColors.background, child: const Icon(Icons.fastfood, size: 80)))),
            SizedBox(height: SizeConfig.h(16)),
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
              child: Text('Fried Chicken Burger', style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(24)))),
            SizedBox(height: SizeConfig.h(9)),
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
              child: Row(children: [
                Icon(Icons.star, color: AppColors.starYellow, size: SizeConfig.w(16)),
                SizedBox(width: SizeConfig.w(5)),
                Text('4.5', style: AppTextStyles.robotoMedium.copyWith(fontSize: SizeConfig.w(14))),
                SizedBox(width: SizeConfig.w(18)),
                Container(width: SizeConfig.w(8), height: 1, color: AppColors.textPrimary),
                SizedBox(width: SizeConfig.w(10)),
                Text('14 mins', style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(14), color: AppColors.textSecondary)),
              ])),
            SizedBox(height: SizeConfig.h(20)),
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
              child: Text('Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection, served on a warm bun with lettuce, tomato, and a creamy sauce.',
                style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(15), color: AppColors.textSecondary, height: 1.5))),
            SizedBox(height: SizeConfig.h(29)),
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _spicySection(), const Spacer(), _portionSection(),
              ])),
            SizedBox(height: SizeConfig.h(60)),
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
              child: Row(children: [
                Container(width: SizeConfig.w(104), height: SizeConfig.h(70),
                  decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(SizeConfig.w(20))),
                  alignment: Alignment.center,
                  child: Text('\$26.99', style: AppTextStyles.poppinsBold.copyWith(fontSize: SizeConfig.w(22), color: AppColors.white))),
                SizedBox(width: SizeConfig.w(49)),
                Expanded(child: GestureDetector(
                  onTap: () {
                    ref.read(cartProvider.notifier).addItem(CartItem(productId: '4', name: 'Fried Chicken Burger', price: '\$26.99', quantity: _quantity));
                    context.push(AppRouter.product5Path);
                  },
                  child: Container(height: SizeConfig.h(70),
                    decoration: BoxDecoration(color: AppColors.textPrimary, borderRadius: BorderRadius.circular(SizeConfig.w(20))),
                    alignment: Alignment.center,
                    child: Text('ORDER NOW', style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(18), color: AppColors.white))))),
              ])),
            SizedBox(height: SizeConfig.h(20)),
          ]),
        ),
      ),
    );
  }

  Widget _spicySection() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text('Spicy', style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(14))),
    SizedBox(height: SizeConfig.h(6)),
    SizedBox(width: SizeConfig.w(200), child: SliderTheme(
      data: SliderThemeData(activeTrackColor: AppColors.primary, inactiveTrackColor: AppColors.background, thumbColor: AppColors.primary,
        overlayShape: SliderComponentShape.noOverlay,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: SizeConfig.w(7)), trackHeight: SizeConfig.h(6)),
      child: Slider(value: _spiceLevel, onChanged: (v) => setState(() => _spiceLevel = v)))),
    SizedBox(height: SizeConfig.h(8)),
    SizedBox(width: SizeConfig.w(200), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text('Mild', style: AppTextStyles.robotoMedium.copyWith(fontSize: SizeConfig.w(12), color: const Color(0xFF1CC019))),
      Text('Hot', style: AppTextStyles.robotoMedium.copyWith(fontSize: SizeConfig.w(12), color: const Color(0xFFEF2A39))),
    ])),
  ]);

  Widget _portionSection() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text('Portion', style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(14))),
    SizedBox(height: SizeConfig.h(11)),
    Row(children: [
      _circleButton(Icons.remove, () { if (_quantity > 1) setState(() => _quantity--); }),
      SizedBox(width: SizeConfig.w(14)),
      Text('$_quantity', style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(18))),
      SizedBox(width: SizeConfig.w(14)),
      _circleButton(Icons.add, () => setState(() => _quantity++)),
    ]),
  ]);

  Widget _circleButton(IconData icon, VoidCallback onTap) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: SizeConfig.w(40),
          height: SizeConfig.w(40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.w(10)),
            color: AppColors.primary,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 13,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Icon(icon, size: SizeConfig.w(18), color: AppColors.white),
        ),
      );
}
