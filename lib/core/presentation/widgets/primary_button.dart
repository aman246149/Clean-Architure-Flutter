import 'package:architecture/core/theme/apptheme.dart';
import 'package:flutter/material.dart';

import '../../theme/app_color.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.onTap,  this.icon, this.padding,
  });
  final String text;
  final Function()? onTap;
  final Widget? icon;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:padding?? const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: onTap != null
                  ? AppColors.primary
                  : Colors.white.withOpacity(0.51)),
          onPressed: () {
            if (onTap != null) onTap!();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text,style: AppTheme.bodyText2,),
              if(icon!=null)...[
              const SizedBox(width: 10,),
              icon!

              ]
            ],
          )
          ),
    );
  }
}
