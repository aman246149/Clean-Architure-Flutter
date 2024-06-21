import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/bloc/auth/auth_bloc.dart';
import 'core/blocobserver/bloc_observer.dart';
import 'core/dependencyInjection/di.dart';
import 'core/routes/router.dart';
import 'core/theme/apptheme.dart';

var logger = Logger();

Future<void> main() async {
  EquatableConfig.stringify = true;
  BindingBase.debugZoneErrorsAreFatal = true;
  await AppContainer.init();
  Bloc.observer = GetIt.I<AppBlocObserver>();
  runZonedGuarded(() {
    runApp(const MyApp());
  }, (e, s) {
    debugPrint('catches error of first error-zone.$e');
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    GetIt.I.registerSingleton<AppRouter>(_appRouter);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: GetIt.I<AuthBloc>()),
      ],
      child: ScreenUtilInit(
        ensureScreenSize: true,
        minTextAdapt: true,
        builder: (_, child) {
          return MaterialApp.router(
            title: 'App',
            routerConfig: _appRouter.config(),
            theme: AppTheme.theme,
            debugShowCheckedModeBanner: false,
          );
        },
        designSize: const Size(390, 755),
      ),
    );
  }
}
