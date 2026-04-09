import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/splash/presentation/splash_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/product/presentation/product_1_screen.dart';
import '../../features/product/presentation/product_2_screen.dart';
import '../../features/product/presentation/product_3_screen.dart';
import '../../features/product/presentation/product_4_screen.dart';
import '../../features/product/presentation/product_5_screen.dart';
import '../../features/payment/presentation/payment_screen.dart';
import '../../features/profile/presentation/user_profile_screen.dart';
import '../../features/support/presentation/customer_support_screen.dart';

class AppRouter {
  static const String splashPath = '/';
  static const String homePath = '/home';
  static const String productPath = '/product/:id';
  static const String paymentPath = '/payment';
  static const String profilePath = '/profile';
  static const String supportPath = '/support';
  static const String product5Path = '/product/5';

  static final router = GoRouter(
    initialLocation: splashPath,
    routes: [
      GoRoute(
        path: splashPath,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: homePath,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: productPath,
        builder: (context, state) {
          final id = state.pathParameters['id'];
          if (id == '1') return const Product1Screen();
          if (id == '2') return const Product2Screen();
          if (id == '3') return const Product3Screen();
          if (id == '4') return const Product4Screen();
          if (id == '5') return const Product5Screen();
          return const Scaffold(body: Center(child: Text('Product not found')));
        },
      ),
      GoRoute(
        path: paymentPath,
        builder: (context, state) => const PaymentScreen(),
      ),
      GoRoute(
        path: profilePath,
        builder: (context, state) => const UserProfileScreen(),
      ),
      GoRoute(
        path: supportPath,
        builder: (context, state) => const CustomerSupportScreen(),
      ),
    ],
  );
}
