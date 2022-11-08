import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

import 'core/blocobserver/bloc_observer.dart';
import 'core/dependencyInjection/di.dart';
import 'core/routes/router.gr.dart';
import 'core/theme/apptheme.dart';

void main() async {
  EquatableConfig.stringify = true;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await AppContainer.init();
  BlocOverrides.runZoned(() => runApp(MyApp()),
      blocObserver: GetIt.I<AppBlocObserver>());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerDelegate: AutoRouterDelegate(_appRouter,
          initialRoutes: [const SplashScreenRoute()]),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
    );
  }
}
