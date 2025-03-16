import 'package:bardix/core/app_constants/barrel_constants.dart';
import 'package:bardix/core/di/service_locator.dart';
import 'package:bardix/core/router/barrel_router.dart';
import 'package:bardix/features/order/presentation/bloc/order_bloc.dart';
import 'package:bardix/features/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => getIt<SplashBloc>()..add(StartSplash()),
    child: BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashCompleted) {
          context.go(AppRoutes.customerInfo, extra: context.read<OrderBloc>());
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: BlocBuilder<SplashBloc, SplashState>(
            builder:
                (context, state) => AnimatedOpacity(
                  opacity: (state is SplashLoading) ? 1.0 : 0.0,
                  duration: const Duration(seconds: 2),
                  child: Image.asset(
                    AppRepoAssets().logoImage,
                    width: 150,
                    height: 150,
                  ),
                ),
          ),
        ),
      ),
    ),
  );
}
