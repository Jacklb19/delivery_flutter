import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

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
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    
    // Original Figma Screen Dimensions
    const double figmaWidth = 430;
    const double figmaHeight = 932;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft, // Using roughly 162deg
            end: Alignment.bottomRight,
            stops: [0.0066, 0.647],
            colors: [
              AppColors.splashGradientStart,
              AppColors.splashGradientEnd,
            ],
          ),
        ),
        child: Stack(
          children: [
            // Text: Foodgo
            Positioned(
              left: width * (129 / figmaWidth),
              top: height * (282 / figmaHeight),
              child: Text(
                'Foodgo',
                style: AppTextStyles.lobsterDisplay.copyWith(
                  fontSize: 60,
                  color: AppColors.white,
                  height: 1.0,
                ),
              ),
            ),
            
            // Image 2 (Background bottom-left image, 246x288) Let's use a network placeholder 
            Positioned(
              left: width * (-42 / figmaWidth),
              top: height * (681 / figmaHeight),
              width: width * (246 / figmaWidth),
              height: height * (288 / figmaHeight),
              child: Image.network(
                'https://placehold.co/246x288/png', // Placeholder for image 2
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(color: Colors.red.withOpacity(0.5)),
              ),
            ),
            
            // Vector (Ellipse top decoration over bottom)
            Positioned(
              left: width * (149 / figmaWidth),
              top: height * (798.5 / figmaHeight),
              width: width * (42 / figmaWidth),
              height: height * (137.5 / figmaHeight),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100), // generic rounded shape approximation
                ),
              ),
            ),

            // Image 1 (Front bottom-right image, 202x202)
            Positioned(
              left: width * (134 / figmaWidth),
              top: height * (758 / figmaHeight),
              width: width * (202 / figmaWidth),
              height: height * (202 / figmaHeight),
              child: Image.network(
                'https://placehold.co/202x202/png', // Placeholder for image 1 (Burger)
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(color: Colors.blue.withOpacity(0.5)),
              ),
            ),
            
            // Ellipse 30 top decoration
            Positioned(
              left: width * (-26 / figmaWidth),
              top: height * (723 / figmaHeight),
              width: width * (57 / figmaWidth),
              height: height * (237 / figmaHeight),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
             // Ellipse 29 bottom decoration
             Positioned(
              left: width * (222 / figmaWidth),
              top: height * (924 / figmaHeight),
              width: width * (108 / figmaWidth),
              height: height * (12 / figmaHeight),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
