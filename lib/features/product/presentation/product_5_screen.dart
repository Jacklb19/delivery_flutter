import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/utils/app_router.dart';
import '../../../core/providers/cart_provider.dart';

class Product5Screen extends ConsumerStatefulWidget {
  const Product5Screen({super.key});
  @override
  ConsumerState<Product5Screen> createState() => _Product5ScreenState();
}

class _Product5ScreenState extends ConsumerState<Product5Screen> {
  int _quantity = 2;
  double _spiceLevel = 0.5;
  final List<bool> _sideOptions = [false, false, false, false, false];
  final _sideNames = ['Fries', 'Coleslaw', 'Salad', 'Onion', 'Mozzarella'];
  final _sideImages = [
    'assets/images/side_fries.png',
    'assets/images/side_coleslaw.png',
    'assets/images/side_salad.png',
    'assets/images/side_onion.png',
    'assets/images/side_mozzarella.png',
  ];
  final _toppingNames = ['Tomato', 'Onions', 'Pickles', 'Bacons', 'Cheese', 'Mushroom', 'Avocado'];
  final _toppingImages = [
    'assets/images/top_tomato.png',
    'assets/images/top_onions.png',
    'assets/images/top_pickles.png',
    'assets/images/top_bacons.png',
    'assets/images/top_cheese.png',
    'assets/images/top_mushroom.png',
    'assets/images/top_avocado.png',
  ];
  final List<bool> _toppings = [false, false, false, false, false, false, false];

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
            // Image + customize text side by side
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Image.asset('assets/images/burger_5.png', width: SizeConfig.w(200), height: SizeConfig.h(280), fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(width: SizeConfig.w(200), height: SizeConfig.h(280), color: AppColors.background, child: const Icon(Icons.fastfood, size: 60))),
                SizedBox(width: SizeConfig.w(12)),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(height: SizeConfig.h(20)),
                  Text('Customize Your Burger to Your Tastes. Ultimate Experience',
                    style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(15))),
                  SizedBox(height: SizeConfig.h(30)),
                  // Spicy
                  Text('Spicy', style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(14))),
                  SizedBox(height: SizeConfig.h(6)),
                  SizedBox(
                    width: SizeConfig.w(200),
                    child: SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: AppColors.primary,
                        inactiveTrackColor: AppColors.background,
                        thumbColor: AppColors.primary,
                        overlayShape: SliderComponentShape.noOverlay,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: SizeConfig.w(7)),
                        trackHeight: SizeConfig.h(6),
                      ),
                      child: Slider(value: _spiceLevel, onChanged: (v) => setState(() => _spiceLevel = v)),
                    ),
                  ),
                  SizedBox(height: SizeConfig.h(8)),
                  SizedBox(
                    width: SizeConfig.w(200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Mild', style: AppTextStyles.robotoMedium.copyWith(fontSize: SizeConfig.w(12), color: const Color(0xFF1CC019))),
                        Text('Hot', style: AppTextStyles.robotoMedium.copyWith(fontSize: SizeConfig.w(12), color: const Color(0xFFEF2A39))),
                      ],
                    ),
                  ),
                  SizedBox(height: SizeConfig.h(20)),
                  // Portion
                  Text('Portion', style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(14))),
                  SizedBox(height: SizeConfig.h(11)),
                  Row(children: [
                    _circleButton(Icons.remove, () { if (_quantity > 1) setState(() => _quantity--); }),
                    SizedBox(width: SizeConfig.w(14)),
                    Text('$_quantity', style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(18))),
                    SizedBox(width: SizeConfig.w(14)),
                    _circleButton(Icons.add, () => setState(() => _quantity++)),
                  ]),
                ])),
              ])),
            SizedBox(height: SizeConfig.h(20)),
            // Toppings
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
              child: Text('Toppings', style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(18)))),
            SizedBox(height: SizeConfig.h(12)),
            SizedBox(height: SizeConfig.h(99),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
                itemCount: _toppingNames.length,
                separatorBuilder: (_, error) => SizedBox(width: SizeConfig.w(30)),
                itemBuilder: (_, i) => _toppingItem(i),
              )),
            SizedBox(height: SizeConfig.h(20)),
            // Side options
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
              child: Text('Side options', style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(18)))),
            SizedBox(height: SizeConfig.h(12)),
            SizedBox(height: SizeConfig.h(116),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
                itemCount: _sideNames.length,
                separatorBuilder: (_, error) => SizedBox(width: SizeConfig.w(30)),
                itemBuilder: (_, i) => _sideItem(i),
              )),
            SizedBox(height: SizeConfig.h(30)),
            // Bottom: Total + ORDER NOW
            Padding(padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Total', style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(16), color: AppColors.textSecondary)),
                SizedBox(height: SizeConfig.h(5)),
                Row(children: [
                  _priceText('\$16.49', AppTextStyles.poppinsBold.copyWith(fontSize: SizeConfig.w(34), color: AppColors.textPrimary)),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      ref.read(cartProvider.notifier).addItem(CartItem(productId: '5', name: 'Custom Burger', price: '\$16.49', quantity: _quantity));
                      context.push(AppRouter.paymentPath);
                    },
                    child: Container(width: SizeConfig.w(200), height: SizeConfig.h(70),
                      decoration: BoxDecoration(color: AppColors.textPrimary, borderRadius: BorderRadius.circular(SizeConfig.w(20))),
                      alignment: Alignment.center,
                      child: Text('ORDER NOW', style: AppTextStyles.robotoSemiBold.copyWith(fontSize: SizeConfig.w(18), color: AppColors.white)))),
                ]),
              ])),
            SizedBox(height: SizeConfig.h(20)),
          ]),
        ),
      ),
    );
  }

  Widget _toppingItem(int i) => GestureDetector(
    onTap: () => setState(() => _toppings[i] = !_toppings[i]),
    child: Column(children: [
      Stack(children: [
        Container(
          width: SizeConfig.w(84),
          height: SizeConfig.h(70),
          decoration: BoxDecoration(
            color: _toppings[i] ? AppColors.primary.withValues(alpha: 0.1) : AppColors.background,
            borderRadius: BorderRadius.circular(SizeConfig.w(15)),
            border: _toppings[i] ? Border.all(color: AppColors.primary, width: 2) : null,
          ),
          alignment: Alignment.center,
          child: Image.asset(_toppingImages[i], width: SizeConfig.w(50), height: SizeConfig.h(50), fit: BoxFit.contain),
        ),
        if (_toppings[i])
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: SizeConfig.h(22),
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(6)),
              decoration: BoxDecoration(
                color: AppColors.textPrimary,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(SizeConfig.w(13))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      _toppingNames[i],
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(10), color: AppColors.white),
                    ),
                  ),
                  Container(
                    width: SizeConfig.w(16),
                    height: SizeConfig.w(16),
                    decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                    child: Icon(Icons.add, size: SizeConfig.w(12), color: AppColors.white),
                  ),
                ],
              ),
            ),
          ),
      ]),
      SizedBox(height: SizeConfig.h(8)),
      if (!_toppings[i])
        Row(mainAxisSize: MainAxisSize.min, children: [
          Text(_toppingNames[i], style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(12), color: AppColors.textSecondary)),
          SizedBox(width: SizeConfig.w(4)),
          Icon(Icons.radio_button_unchecked, size: SizeConfig.w(16), color: AppColors.textSecondary),
        ]),
    ]));

  Widget _sideItem(int i) => GestureDetector(
    onTap: () => setState(() => _sideOptions[i] = !_sideOptions[i]),
    child: Column(children: [
      Stack(children: [
        Container(
          width: SizeConfig.w(84),
          height: SizeConfig.h(86),
          decoration: BoxDecoration(
            color: _sideOptions[i] ? AppColors.primary.withValues(alpha: 0.1) : AppColors.background,
            borderRadius: BorderRadius.circular(SizeConfig.w(15)),
            border: _sideOptions[i] ? Border.all(color: AppColors.primary, width: 2) : null,
          ),
          alignment: Alignment.center,
          child: Image.asset(_sideImages[i], width: SizeConfig.w(65), height: SizeConfig.h(65), fit: BoxFit.contain),
        ),
        if (_sideOptions[i])
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: SizeConfig.h(24),
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(6)),
              decoration: BoxDecoration(
                color: AppColors.textPrimary,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(SizeConfig.w(13))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      _sideNames[i],
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(10), color: AppColors.white),
                    ),
                  ),
                  Container(
                    width: SizeConfig.w(16),
                    height: SizeConfig.w(16),
                    decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                    child: Icon(Icons.add, size: SizeConfig.w(12), color: AppColors.white),
                  ),
                ],
              ),
            ),
          ),
      ]),
      SizedBox(height: SizeConfig.h(8)),
      if (!_sideOptions[i])
        Row(mainAxisSize: MainAxisSize.min, children: [
          Text(_sideNames[i], style: AppTextStyles.robotoRegular.copyWith(fontSize: SizeConfig.w(12), color: AppColors.textSecondary)),
          SizedBox(width: SizeConfig.w(4)),
          Icon(Icons.radio_button_unchecked, size: SizeConfig.w(16), color: AppColors.textSecondary),
        ]),
    ]));

  Widget _priceText(String value, TextStyle style) {
    if (!value.startsWith('\$')) {
      return Text(value, style: style);
    }
    return RichText(
      text: TextSpan(
        style: style,
        children: [
          TextSpan(text: '\$', style: style.copyWith(color: AppColors.primary)),
          TextSpan(text: value.substring(1)),
        ],
      ),
    );
  }

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
