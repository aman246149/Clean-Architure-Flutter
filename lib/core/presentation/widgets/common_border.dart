import 'package:flutter/material.dart';

class CommonBorder extends StatelessWidget {
  const CommonBorder({
    super.key, required this.child,
  });
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
          top: 12,
          left: 16,
          right: 16,
          bottom: 12,
      ),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF938F99)),
          borderRadius: BorderRadius.circular(11),
        ),
      ),
      child: child,
      );
  }
}