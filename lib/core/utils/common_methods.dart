import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'loader.dart';

void showOverlayLoader(BuildContext context) {
  GetIt.instance<Loader>().showLoader(context);
}

void hideOverlayLoader(BuildContext context) {
  debugPrint("Hiding Loader");
  GetIt.instance<Loader>().hideLoader(context);
}

void showSnackbar(context, String message) {
  Flushbar(
    message: message,
    duration: const Duration(seconds: 3),
  ).show(context);
}
void showErrorSnackbar(context, message) {
  var title = "Error";
  Flushbar(
    title: title,
    backgroundColor:Colors.red,
    message: message,
    duration: const Duration(seconds: 3),
  ).show(context);
}

void showSuccessSnackbar(context, message) {
  var title = "Success";
  Flushbar(
    title: title,
    backgroundColor:Colors.green,
    message: message,
    duration: const Duration(seconds: 3),
  ).show(context);
}

String getPathParamsFromUrl(String uri, Map<String, dynamic> data) {
  List<String> subStrings = uri.split("/");
  var paramIndex = subStrings.indexWhere((element) => element.startsWith(":"));
  subStrings[paramIndex] = data[subStrings[paramIndex].substring(1)].toString();
  return subStrings.join("/");
}

double calculateSizeInMb(sizeInBytes) => sizeInBytes / (1024 * 1024);