import 'package:bardix/core/router/app_routs.dart';
import 'package:bardix/core/widgets/barrel_widgets.dart';
import 'package:bardix/features/order/presentation/screens/customer_info_screen.dart';
import 'package:bardix/features/order/presentation/screens/package_details_screen.dart';
import 'package:bardix/features/order/presentation/screens/payment_screen.dart';
import 'package:bardix/features/order/presentation/screens/review_submit_screen.dart';
import 'package:bardix/features/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  errorPageBuilder:
      (context, state) => MaterialPage(child: const PageNotFoundScreen()),
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.customerInfo,
      builder: (context, state) => CustomerInfoScreen(),
    ),
    GoRoute(
      path: AppRoutes.packageDetails,
      builder: (context, state) => const PackageDetailsScreen(),
    ),
    GoRoute(
      path: AppRoutes.payment,
      builder: (context, state) => const PaymentScreen(),
    ),
    GoRoute(
      path: AppRoutes.reviewSubmit,
      builder: (context, state) => ReviewSubmitScreen(),
    ),
  ],
);
