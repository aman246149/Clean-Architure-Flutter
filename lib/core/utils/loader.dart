import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

@lazySingleton
class Loader {
  bool loaderShowing = false;

  void showLoader(BuildContext context) {
    if (!loaderShowing) {
      loaderShowing = true;
      showDialog(
          context: context,
          builder: ((context) => LoadingWidget()),
          barrierDismissible: false);
    }
  }

  void hideLoader(BuildContext context) {
    if (loaderShowing) {
      Navigator.of(context, rootNavigator: true).pop();
      loaderShowing = false;
    }
  }
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 50,
      child: LoadingAnimationWidget.twistingDots(
        leftDotColor: const Color.fromARGB(255, 255, 255, 255),
        rightDotColor: const Color(0xFFEA3799),
        size: 50,
      ),
    ));
  }
}
