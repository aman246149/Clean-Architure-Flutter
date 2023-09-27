import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import '../../features/auth/screens/login.dart';
import '../../features/auth/screens/verify_otp.dart';
import '../../features/onboarding/screens/onboarding.dart';
import '../../features/splashScreen/splash_screen.dart';

@AdaptiveAutoRouter(replaceInRouteName: 'Screen', routes: [
  AutoRoute(path: '', page: SplashScreen, initial: true),
  AutoRoute(path: '', page: LoginScreen),
  AutoRoute(path: '', page: OnBoardingScreen),
  AutoRoute(path: '', page: VerifyOtp),
])
class $AppRouter {}
