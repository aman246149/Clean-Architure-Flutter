// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:architecture/core/presentation/widgets/hspace.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/apptheme.dart';

class Label extends StatelessWidget {
  const Label({
    Key? key,
    required this.text1,
    this.subtitle,
    this.isStartRequired = false,
    this.labelColor,
    this.fontsize,
    this.fontWeight,
    this.labelfontWeight,
  }) : super(key: key);
  final String text1;
  final String? subtitle;
  final bool isStartRequired;
  final Color? labelColor;
  final double? fontsize;
  final FontWeight? fontWeight;
  final FontWeight? labelfontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: AppTheme.bodyText2.copyWith(
              fontWeight: labelfontWeight ?? FontWeight.w700,
              color: labelColor,
              fontSize: fontsize),
        ),
        if (isStartRequired) ...[
          Text(
            "*",
            style: AppTheme.bodyText2
                .copyWith(fontWeight: fontWeight ?? FontWeight.w700),
          ),
          const Hspace(6),
        ],
        if (subtitle != null) ...[
          Text(
            subtitle!,
            style: AppTheme.bodyText2.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: ScreenUtil().setSp(fontsize ?? 12),
                color: const Color(0xFF9B9B9B)),
          ),
        ]
      ],
    );
  }
}




class CommonTextWidget extends StatelessWidget {
  final String text1;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const CommonTextWidget({super.key, 
    required this.text1,
    this.fontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text1,
      style: AppTheme.bodyText2.copyWith(
        fontSize: fontSize ?? 16.0, // Default fontSize is 16.0
        fontWeight: fontWeight ?? FontWeight.normal, // Default fontWeight is normal
        color: color ?? Colors.black, // Default color is black
      ),
    );
  }
}
