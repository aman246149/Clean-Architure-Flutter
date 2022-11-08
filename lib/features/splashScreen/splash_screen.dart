import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get_it/get_it.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../core/images/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToHomePage();
    FlutterNativeSplash.remove();
  }

  void goToHomePage() {
    Future.delayed(const Duration(seconds: 1), () {
      // context.router
      //     .replaceAll([AuthValidationRoute(auth: GetIt.I<FirebaseAuth>())]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppImages.splashImage),
          LoadingAnimationWidget.twistingDots(
            leftDotColor: const Color.fromARGB(255, 255, 255, 255),
            rightDotColor: const Color(0xFFEA3799),
            size: 50,
          ),
        ],
      )),
    );
  }
}
