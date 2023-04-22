import 'package:architecture/core/presentation/widgets/custom_text.dart';
import 'package:architecture/core/presentation/widgets/hspace.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? text;
  final double fontsize;
  final bool? isArrowRequired;
  final bool? isRightTextRequired;
  final String? rightText;
  const CommonAppBar(
      {super.key,
      this.text,
      this.fontsize = 24,
      this.isArrowRequired = true,
      this.rightText = "",
      this.isRightTextRequired = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text ?? "",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: fontsize),
      ),
      centerTitle: false,
      actions: [
        isRightTextRequired!
            ? Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Center(
                  child: TextWidget(
                    text: rightText ?? "",
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WidgetAppBar(
      {super.key,
      required this.text,
      required this.action,
      this.widget,
      this.fontsize = 24});
  final String text;
  final Widget? widget;
  final Widget action;
  final double? fontsize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: fontsize!),
          ),
          const Hspace(9),
          widget ?? const SizedBox.shrink()
        ],
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Center(
            child: action,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
