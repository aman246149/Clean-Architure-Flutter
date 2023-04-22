import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import '../../features/auth/presentation/screens/login.dart';
import '../../features/auth/presentation/screens/signup.dart';
import '../../features/splashScreen/splash_screen.dart';

@AdaptiveAutoRouter(replaceInRouteName: 'Screen', routes: [
  AutoRoute(path: '', page: SplashScreen, initial: true),
  AutoRoute(path: '', page: LoginScreen),
  AutoRoute(path: '', page: SignUpScreen),
])
class $AppRouter {}
