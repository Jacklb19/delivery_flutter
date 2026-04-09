import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.8, -0.6),
            end: Alignment(0.8, 0.6),
            colors: [
              AppColors.splashGradientStart,
              AppColors.splashGradientEnd,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Logo
            Positioned(
              left: SizeConfig.w(129),
              top: SizeConfig.h(282),
              child: Text(
                'Foodgo',
                style: AppTextStyles.lobsterDisplay.copyWith(
                  fontSize: SizeConfig.w(60),
                  color: AppColors.white,
                ),
              ),
            ),
            // Front food image placeholder (now back because of order)
            Positioned(
              left: SizeConfig.w(134),
              top: SizeConfig.h(758),
              child: Image.asset(
                'assets/images/burger_2.png',
                width: SizeConfig.w(202),
                height: SizeConfig.h(202),
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => SizedBox(
                  width: SizeConfig.w(202),
                  height: SizeConfig.h(202),
                ),
              ),
            ),
            // Bottom food image placeholder (now front because of order)
            Positioned(
              left: SizeConfig.w(-42),
              top: SizeConfig.h(681),
              child: Image.asset(
                'assets/images/splash_food_1.png',
                width: SizeConfig.w(246),
                height: SizeConfig.h(288),
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => SizedBox(
                  width: SizeConfig.w(246),
                  height: SizeConfig.h(288),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
