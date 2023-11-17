import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key, this.color,
  });
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return  Divider(
      color: color??const Color(0xFFFF9797),
      thickness: 1,
    );
  }
}
