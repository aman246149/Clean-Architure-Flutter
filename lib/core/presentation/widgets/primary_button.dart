// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_color.dart';
import '../../theme/apptheme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    this.onTap,
    this.icon,
    this.padding,
    this.color,
    this.textColor,
    this.fontsize,
    this.fontWeight,
    this.innerPadding,
    this.frontIcon,
    this.borderColor,
    this.frontIconWidth,
    this.borderRadius
  }) : super(key: key);
  final String text;
  final Function()? onTap;
  final Widget? icon;
  final EdgeInsets? padding;
  final Color? color;
  final Color? textColor;
  final double? fontsize;
  final FontWeight? fontWeight;
  final MaterialStateProperty<EdgeInsetsGeometry?>? innerPadding;
  final Widget? frontIcon;
  final Color? borderColor;
  final double? frontIconWidth;
  final double? borderRadius;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20).r,
      child: TextButton(
          style: ButtonStyle(
            padding: innerPadding,
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius??30.0),
                side: BorderSide(
                    color: onTap != null
                        ? borderColor ?? Colors.red
                        : Colors.grey.withOpacity(0.71)),
              ),
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {}
                return onTap != null
                    ? color ?? AppColors.primary
                    : Colors.grey.withOpacity(0.71);
              },
            ),
          ),
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (frontIcon != null) ...[
                frontIcon!,
                SizedBox(
                  width:frontIconWidth?? 16.w,
                ),
              ],
              Flexible(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppTheme.bodyText2.copyWith(
                      color: textColor ?? Colors.white,
                      fontSize: fontsize ?? 14.sp,
                      fontWeight: fontWeight ?? FontWeight.bold),
                ),
              ),
              if (icon != null) ...[
                SizedBox(
                  width: 10.w,
                ),
                icon!
              ]
            ],
          )),
    );
  }
}

class PrimaryOutlineButton extends StatelessWidget {
  const PrimaryOutlineButton({
    Key? key,
    required this.text,
    this.onTap,
    this.icon,
    this.padding,
    this.outlineColor,
    this.textColor,
    this.fontsize,
    this.fontWeight,
  }) : super(key: key);
  final String text;
  final Function()? onTap;
  final Widget? icon;
  final EdgeInsets? padding;
  final Color? outlineColor;
  final Color? textColor;
  final double? fontsize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20).r,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(
                width: 1, color: outlineColor ?? const Color(0xFFFF9797)),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32))
            // foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            //   (Set<MaterialState> states) {
            //     return textColor ?? AppColors.primary;
            //   },
            // ),
            ),
        onPressed: () {
          if (onTap != null) onTap!();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: AppTheme.bodyText2.copyWith(
                  color: textColor ?? AppColors.white,
                  fontSize: fontsize ?? 14.sp,
                  fontWeight: fontWeight ?? FontWeight.w700,
                ),
              ),
              if (icon != null) ...[
                const SizedBox(
                  width: 10,
                ),
                icon!
              ]
            ],
          ),
        ),
      ),
    );
  }
}
