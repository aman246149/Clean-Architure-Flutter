import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import '../../features/splashScreen/splash_screen.dart';

@AdaptiveAutoRouter(replaceInRouteName: 'Screen', routes: [
  AutoRoute(path: '', page: SplashScreen, initial: true),
])
class $AppRouter {}
