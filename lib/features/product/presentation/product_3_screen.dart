import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/utils/app_router.dart';
import '../../../core/providers/cart_provider.dart';

class Product3Screen extends ConsumerStatefulWidget {
  const Product3Screen({super.key});
  @override
  ConsumerState<Product3Screen> createState() => _Product3ScreenState();
}

class _Product3ScreenState extends ConsumerState<Product3Screen> {
  int _quantity = 2;
  double _spiceLevel = 0.6;

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
            Center(child: Image.asset('assets/images/burger_3.png', width: SizeConfig.w(400), height: SizeConfig.h(367), fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(width: SizeConfig.w(400), height: SizeConfig.h(367), color: AppColors.background, child: const Icon(Icons.fastfood, size: 80)))),
            SizedBox(height: SizeConfig.h(16)),
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
              child: Text('Hamburger Chicken Burger', style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(24)))),
            SizedBox(height: SizeConfig.h(9)),
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
              child: Row(children: [
                Icon(Icons.star, color: AppColors.starYellow, size: SizeConfig.w(16)),
                SizedBox(width: SizeConfig.w(5)),
                Text('4.6', style: AppTextStyles.robotoMedium.copyWith(fontSize: SizeConfig.w(14))),
                SizedBox(width: SizeConfig.w(18)),
                Container(width: SizeConfig.w(8), height: 1, color: AppColors.textPrimary),
                SizedBox(width: SizeConfig.w(10)),
                Text('42 mins', style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(14), color: AppColors.textSecondary)),
              ])),
            SizedBox(height: SizeConfig.h(20)),
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
              child: Text('Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option. Try it today and experience the mouth-watering flavors of our Hamburger Chicken Burger!',
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
                  child: Text('\$12.48', style: AppTextStyles.poppinsBold.copyWith(fontSize: SizeConfig.w(22), color: AppColors.white))),
                SizedBox(width: SizeConfig.w(49)),
                Expanded(child: GestureDetector(
                  onTap: () {
                    ref.read(cartProvider.notifier).addItem(CartItem(productId: '3', name: 'Hamburger Chicken Burger', price: '\$12.48', quantity: _quantity));
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
