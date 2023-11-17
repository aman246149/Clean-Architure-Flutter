// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_color.dart';
import '../../theme/apptheme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key,
      this.padding,
      this.rightText,
      this.rightTextOnTap,
      this.arrowColor,
      this.middleText,
      this.middleColor,
      this.rightWidget,
      this.middleWidget})
      : super(key: key);
  final EdgeInsets? padding;
  final String? rightText;
  final Function()? rightTextOnTap;
  final Color? arrowColor;
  final String? middleText;
  final Color? middleColor;
  final Widget? rightWidget;
  final Widget? middleWidget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 18).w,
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  context.router.pop();
                },
                child: Container(
                  color: Colors.transparent,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: arrowColor ?? AppColors.white,
                  ),
                ),
              ),
              if (middleWidget != null) ...[middleWidget!],
              if (middleText != null) ...[
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80).w,
                    child: Text(
                      middleText!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.bodyText3.copyWith(
                          fontSize: 16.sp,
                          color: middleColor ?? AppColors.primary,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
              if (rightWidget != null) ...[
                Align(alignment: Alignment.centerRight, child: rightWidget!)
              ],
              if (rightText != null) ...[
                GestureDetector(
                  onTap: () {
                    rightTextOnTap!();
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      rightText!,
                      style: AppTheme.bodyText3.copyWith(
                          color: AppColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarN extends StatelessWidget implements PreferredSizeWidget {
  const AppBarN({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
          onTap: () {
            context.router.pop();
          },
          child: const Icon(Icons.arrow_back_ios)),
      title: Text(text,
          style: AppTheme.bodyText3.copyWith(
              fontSize: 16.sp,
              color: AppColors.white,
              fontWeight: FontWeight.w700)),
      elevation: 0,
      backgroundColor: AppColors.primary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({
    Key? key,
    required this.onTap,
    required this.iconData,
  }) : super(key: key);

  final Function() onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Icon(iconData));
  }
}
