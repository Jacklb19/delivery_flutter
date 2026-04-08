import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/size_config.dart';
import '../../../shared/widgets/search_bar_widget.dart';
import '../../../shared/widgets/category_button.dart';
import '../../../shared/widgets/food_card.dart';
import '../../../shared/widgets/custom_bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + SizeConfig.h(28),
              bottom: SizeConfig.h(120),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Foodgo',
                        style: AppTextStyles.lobsterDisplay.copyWith(
                          fontSize: SizeConfig.w(45),
                          height: 1.0,
                        ),
                      ),
                      Container(
                        width: SizeConfig.w(60),
                        height: SizeConfig.w(60),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(SizeConfig.w(20)),
                          image: const DecorationImage(
                            image: NetworkImage('https://placehold.co/60x60/png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: SizeConfig.h(16)),
                
                // Subtitle
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
                  child: Text(
                    'Order your favourite food!',
                    style: AppTextStyles.poppinsHeading.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: SizeConfig.w(18),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                
                SizedBox(height: SizeConfig.h(56)),
                
                // Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
                  child: const CustomSearchBar(),
                ),

                SizedBox(height: SizeConfig.h(41)),

                // Categories
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
                  child: Row(
                    children: [
                      CategoryButton(title: 'All', isSelected: true, width: SizeConfig.w(75)),
                      SizedBox(width: SizeConfig.w(14)),
                      CategoryButton(title: 'Combos', width: SizeConfig.w(120)),
                      SizedBox(width: SizeConfig.w(14)),
                      CategoryButton(title: 'Sliders', width: SizeConfig.w(120)),
                      SizedBox(width: SizeConfig.w(14)),
                      CategoryButton(title: 'Classic', width: SizeConfig.w(110)),
                    ],
                  ),
                ),

                SizedBox(height: SizeConfig.h(41)),

                // Food Grid
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeConfig.w(19)),
                  child: Wrap(
                    spacing: SizeConfig.w(22),
                    runSpacing: SizeConfig.h(31),
                    children: [
                      FoodCard(
                        titlePart1: 'Cheeseburger\n',
                        titlePart2: "Wendy's Burger",
                        rating: '4.9',
                        imageUrl: 'https://placehold.co/120x122/png',
                        onTap: () => context.push('/product/1'),
                      ),
                      FoodCard(
                        titlePart1: 'Hamburger\n',
                        titlePart2: "Veggie Burger",
                        rating: '4.8',
                        imageUrl: 'https://placehold.co/120x122/png',
                        onTap: () => context.push('/product/2'),
                      ),
                      FoodCard(
                        titlePart1: 'Hamburger\n',
                        titlePart2: "Chicken Burger",
                        rating: '4.6',
                        imageUrl: 'https://placehold.co/120x122/png',
                        onTap: () => context.push('/product/3'),
                      ),
                      FoodCard(
                        titlePart1: 'Hamburger\n',
                        titlePart2: "Fried Chicken Burger",
                        rating: '4.5',
                        imageUrl: 'https://placehold.co/120x122/png',
                        onTap: () => context.push('/product/4'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          const Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNav(currentIndex: 0),
          ),
        ],
      ),
    );
  }
}
