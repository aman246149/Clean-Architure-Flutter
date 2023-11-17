import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class AppBackGround extends StatelessWidget {
  const AppBackGround({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.primary,
      child: child,
    );
  }
}
