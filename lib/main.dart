import 'package:bardix/core/di/service_locator.dart';
import 'package:bardix/core/localization/localization_service.dart';
import 'package:bardix/core/router/barrel_router.dart';
import 'package:bardix/core/theme/blocs/theme_bloc.dart';
import 'package:bardix/core/utils/size_utils.dart';
import 'package:bardix/features/order/presentation/bloc/order_bloc.dart';
import 'package:bardix/features/splash/bloc/splash_bloc.dart';
import 'package:bardix/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*
    * This will make splash screen lasts for the duration of the delay task.
    * 300ms looks well for me, can adjust based on your preference.
  */
  Future.delayed(Duration.zero);
  await Future.delayed(const Duration(milliseconds: 300));

  injectorSetup();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive, overlays: []);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  LocalizationService().loadSavedLocale(); // ✅ Load saved locale

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SplashBloc>()),
        BlocProvider(create: (context) => getIt<ThemeBloc>()),
        BlocProvider(create: (context) => getIt<OrderBloc>()),
      ],
      child: Builder(
        builder: (context) {
          SizeUtils.init(context); // Initialize devicePixelRatio
          return MyApp();
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ThemeBloc, ThemeState>(
    builder:
        (context, state) => ValueListenableBuilder<Locale>(
          valueListenable: getIt<LocalizationService>().currentLocale,
          builder: (context, locale, child) => MaterialApp.router(
              routerConfig: appRouter,
              debugShowCheckedModeBanner: false,
              theme: state.themeData,
              locale: locale,
              supportedLocales: S.supportedLocales,
              localizationsDelegates: S.localizationsDelegates,
            ),
        ),
  );
}
