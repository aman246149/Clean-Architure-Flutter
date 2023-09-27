import 'package:flutter/material.dart';

class GradientBackGround extends StatelessWidget {
  final double? height;
  final double? width;
  final List<Color>? color;
  final Widget? child;
  const GradientBackGround({super.key,this.height,this.width,this.color, this.child });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height??double.infinity,
        width: width??double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: color??[const Color(0xff4D1A10),const Color(0xff130A07)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
         
          )
        ),
        child: child,
      );
  }
}