// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCommonBorder extends StatelessWidget {
  const AppCommonBorder({
    Key? key,
    this.child,
    this.borderColor,
    this.borderRadius,
  }) : super(key: key);
  final Widget? child;
  final Color? borderColor;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 12).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        border: Border.all(
          color: borderColor ?? const Color(0xFF808080),
        ),
      ),
      child: child,
    );
  }
}

class AppShadowBorder extends StatelessWidget {
  const AppShadowBorder({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7).r,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 3,
            offset: Offset(0, 0.80),
            spreadRadius: 0,
          )
        ],
      ),
      child: child,
    );
  }
}
