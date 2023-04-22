import 'package:flutter/material.dart';

import 'custom_text.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: onTap != null
                  ? const Color(0xffE8AE56)
                  : Colors.white.withOpacity(0.51)),
          onPressed: () {
            if (onTap != null) onTap!();
          },
          child: TextWidget(
            text: text,
            color: const Color(0xff111314),
            fontSize: 16,
          )),
    );
  }
}
