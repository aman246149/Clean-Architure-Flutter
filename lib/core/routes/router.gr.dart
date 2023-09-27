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
import 'package:architecture/features/auth/screens/login.dart' as _i2;
import 'package:architecture/features/auth/screens/verify_otp.dart' as _i4;
import 'package:architecture/features/onboarding/screens/onboarding.dart'
    as _i3;
import 'package:architecture/features/splashScreen/splash_screen.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginScreen(),
      );
    },
    OnBoardingScreenRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.OnBoardingScreen(),
      );
    },
    VerifyOtpRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.VerifyOtp(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '',
          fullMatch: true,
        ),
        _i5.RouteConfig(
          SplashScreenRoute.name,
          path: '',
        ),
        _i5.RouteConfig(
          LoginScreenRoute.name,
          path: '',
        ),
        _i5.RouteConfig(
          OnBoardingScreenRoute.name,
          path: '',
        ),
        _i5.RouteConfig(
          VerifyOtpRoute.name,
          path: '',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i5.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginScreenRoute extends _i5.PageRouteInfo<void> {
  const LoginScreenRoute()
      : super(
          LoginScreenRoute.name,
          path: '',
        );

  static const String name = 'LoginScreenRoute';
}

/// generated route for
/// [_i3.OnBoardingScreen]
class OnBoardingScreenRoute extends _i5.PageRouteInfo<void> {
  const OnBoardingScreenRoute()
      : super(
          OnBoardingScreenRoute.name,
          path: '',
        );

  static const String name = 'OnBoardingScreenRoute';
}

/// generated route for
/// [_i4.VerifyOtp]
class VerifyOtpRoute extends _i5.PageRouteInfo<void> {
  const VerifyOtpRoute()
      : super(
          VerifyOtpRoute.name,
          path: '',
        );

  static const String name = 'VerifyOtpRoute';
}
