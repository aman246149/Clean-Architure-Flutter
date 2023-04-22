import 'package:flutter/material.dart';


class DecoratedContainer extends StatelessWidget {
  const DecoratedContainer({
    super.key,
    this.containerColor = Colors.white,
    this.borderWidth = 0.5,
    this.borderColor = const Color(0xffCCCCCC),
    this.borderRadius = 8,
    this.padding = const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
    required this.child,
    this.height,
    this.width,
    this.image,
    this.margin,
    this.onTap,
  });
  final Color? containerColor;
  final double? borderWidth;
  final Color? borderColor;
  final double? borderRadius;
  final Widget child;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final DecorationImage? image;
  final EdgeInsets? margin;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
            color: containerColor,
            image: image,
            borderRadius: BorderRadius.circular(borderRadius!),
            border: Border.all(color: borderColor!, width: borderWidth!)
        ),
        child: child,
      ),
    );
  }
}