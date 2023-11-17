import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../utils/common_methods.dart';


class Messenger {
  static errorSnackbar(String errorMessage) {
   BuildContext? context= GetIt.I<AutoRouter>().navigatorKey?.currentContext;
    showErrorSnackbar(context,errorMessage);
  }
  static successSnackbar(String successMessage) {
   BuildContext? context= GetIt.I<AutoRouter>().navigatorKey?.currentContext;
    showSuccessSnackbar(context,successMessage);
  }
}
