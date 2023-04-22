import 'package:architecture/core/bloc/auth/auth_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/blocobserver/bloc_observer.dart';
import 'core/dependencyInjection/di.dart';
import 'core/routes/router.gr.dart';
import 'core/theme/apptheme.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  EquatableConfig.stringify = true;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await AppContainer.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BlocOverrides.runZoned(() => runApp(MyApp()),
      blocObserver: GetIt.I<AppBlocObserver>());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: GetIt.I<AuthBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        routerDelegate: AutoRouterDelegate(_appRouter,
            initialRoutes: [const LoginScreenRoute()]),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
