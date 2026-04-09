import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/providers/cart_provider.dart';
import '../../../shared/widgets/custom_bottom_nav.dart';
import '../../../shared/widgets/search_bar_widget.dart';
import '../../../shared/widgets/category_button.dart';
import '../../../shared/widgets/food_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedCategory = 0;
  String _searchQuery = '';

  final categories = ['All', 'Combos', 'Sliders', 'Classic'];

  final foods = const [
    {'id': '1', 'title': 'Cheeseburger', 'subtitle': "Wendy's Burger", 'rating': '4.9', 'image': 'assets/images/burger_1.png'},
    {'id': '2', 'title': 'Hamburger', 'subtitle': 'Veggie Burger', 'rating': '4.8', 'image': 'assets/images/burger_2.png'},
    {'id': '3', 'title': 'Hamburger', 'subtitle': 'Chicken Burger', 'rating': '4.6', 'image': 'assets/images/burger_3.png'},
    {'id': '4', 'title': 'Hamburger', 'subtitle': 'Fried Chicken Burger', 'rating': '4.5', 'image': 'assets/images/burger_4.png'},
  ];

  List<Map<String, String>> get filteredFoods {
    if (_searchQuery.isEmpty) return foods;
    return foods.where((f) {
      final name = '${f['title']} ${f['subtitle']}'.toLowerCase();
      return name.contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final cartItems = ref.watch(cartProvider);
    final totalItems = cartItems.fold<int>(0, (sum, item) => sum + item.quantity);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.h(14)),
                // Header row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Foodgo',
                      style: AppTextStyles.lobsterDisplay.copyWith(
                        fontSize: SizeConfig.w(45),
                        color: AppColors.textPrimary,
                      ),
                    ),
                    // Profile avatar with cart badge
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                          child: Image.asset(
                            'assets/images/profile_avatar.png',
                            width: SizeConfig.w(60),
                            height: SizeConfig.w(60),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => Container(
                              width: SizeConfig.w(60),
                              height: SizeConfig.w(60),
                              decoration: BoxDecoration(
                                color: AppColors.background,
                                borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                              ),
                              child: const Icon(Icons.person),
                            ),
                          ),
                        ),
                        if (totalItems > 0)
                          Positioned(
                            top: -4,
                            right: -4,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '$totalItems',
                                style: AppTextStyles.robotoText.copyWith(
                                  fontSize: 10,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.h(3)),
                Text(
                  'Order your favourite food!',
                  style: AppTextStyles.poppinsHeading.copyWith(
                    fontSize: SizeConfig.w(18),
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: SizeConfig.h(47)),
                // Search bar
                CustomSearchBar(
                  onChanged: (value) => setState(() => _searchQuery = value),
                ),
                SizedBox(height: SizeConfig.h(38)),
                // Category filter
                SizedBox(
                  height: SizeConfig.h(70),
                  child: ListView.separated(
                    clipBehavior: Clip.none,
                    padding: EdgeInsets.symmetric(vertical: SizeConfig.h(6)),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (_, error) => SizedBox(width: SizeConfig.w(14)),
                    itemBuilder: (_, i) => CategoryButton(
                      label: categories[i],
                      isSelected: _selectedCategory == i,
                      onTap: () => setState(() => _selectedCategory = i),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.h(41)),
                // Food grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: SizeConfig.w(22),
                    mainAxisSpacing: SizeConfig.h(31),
                    childAspectRatio: 185 / 225,
                  ),
                  itemCount: filteredFoods.length,
                  itemBuilder: (_, i) {
                    final food = filteredFoods[i];
                    return FoodCard(
                      title: food['title']!,
                      subtitle: food['subtitle']!,
                      rating: food['rating']!,
                      imageUrl: food['image']!,
                      onTap: () => context.push('/product/${food['id']}'),
                    );
                  },
                ),
                SizedBox(height: SizeConfig.h(110)),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/home'), // Home refresh or typical FAB behavior
        backgroundColor: AppColors.primary,
        elevation: 10,
        shape: const CircleBorder(), // No border, as requested
        child: const Icon(Icons.add, color: AppColors.white, size: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
    );
  }
}
