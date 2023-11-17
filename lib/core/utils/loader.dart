import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Loader {
  bool loaderShowing = false;

  void showLoader(BuildContext context) {
    if (!loaderShowing) {
      loaderShowing = true;
      showDialog(
          context: context,
          builder: ((context) => const LoadingWidget()),
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
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      width: 50,
      child: Center(
        child: LinearProgressIndicator(),
      ),
    ));
  }
}
