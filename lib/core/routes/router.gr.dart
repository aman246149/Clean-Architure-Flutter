// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:architecture/core/presentation/widgets/inappwebview.dart'
    as _i1;
import 'package:architecture/features/splashScreen/splash_screen.dart' as _i2;
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    InAppWeb.name: (routeData) {
      final args = routeData.argsAs<InAppWebArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.InAppWeb(
          key: args.key,
          url: args.url,
          isAppBarNeeded: args.isAppBarNeeded,
          text: args.text,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.InAppWeb]
class InAppWeb extends _i3.PageRouteInfo<InAppWebArgs> {
  InAppWeb({
    _i4.Key? key,
    required String url,
    bool isAppBarNeeded = true,
    String? text,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          InAppWeb.name,
          args: InAppWebArgs(
            key: key,
            url: url,
            isAppBarNeeded: isAppBarNeeded,
            text: text,
          ),
          initialChildren: children,
        );

  static const String name = 'InAppWeb';

  static const _i3.PageInfo<InAppWebArgs> page =
      _i3.PageInfo<InAppWebArgs>(name);
}

class InAppWebArgs {
  const InAppWebArgs({
    this.key,
    required this.url,
    this.isAppBarNeeded = true,
    this.text,
  });

  final _i4.Key? key;

  final String url;

  final bool isAppBarNeeded;

  final String? text;

  @override
  String toString() {
    return 'InAppWebArgs{key: $key, url: $url, isAppBarNeeded: $isAppBarNeeded, text: $text}';
  }
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i3.PageRouteInfo<void> {
  const SplashRoute({List<_i3.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
