import 'dart:async';


import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'core/bloc/auth/auth_bloc.dart';
import 'core/dependencyInjection/di.dart';
import 'core/routes/router.dart';
import 'core/theme/apptheme.dart';

var logger = Logger();


Future<void> main() async {
  EquatableConfig.stringify=true;
  BindingBase.debugZoneErrorsAreFatal = true;
  await AppContainer.init();
  runZonedGuarded(() {
    runApp( MyApp());
  }, (e, s) {
    debugPrint('catches error of first error-zone.$e');
  });
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
        title: 'Blue Thunder',
        // routerDelegate: AutoRouterDelegate(_appRouter,
        //     initialRoutes: []),
        // routeInformationParser: _appRouter.defaultRouteParser(),
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
