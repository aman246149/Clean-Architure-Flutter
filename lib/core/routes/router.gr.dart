// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:architecture/features/auth/presentation/screens/login.dart'
    as _i2;
import 'package:architecture/features/auth/presentation/screens/signup.dart'
    as _i3;
import 'package:architecture/features/splashScreen/splash_screen.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    SignUpScreenRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignUpScreen(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          SplashScreenRoute.name,
          path: '',
        ),
        _i4.RouteConfig(
          LoginScreenRoute.name,
          path: '',
        ),
        _i4.RouteConfig(
          SignUpScreenRoute.name,
          path: '',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i4.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i4.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i3.SignUpScreen]
class SignUpScreenRoute extends _i4.PageRouteInfo<void> {
  const SignUpScreenRoute()
      : super(
          SignUpScreenRoute.name,
          path: '',
        );

  static const String name = 'SignUpScreenRoute';
}
