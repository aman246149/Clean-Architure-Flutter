
import 'package:bluethunder/core/presentation/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import '../../theme/app_color.dart';
import '../../theme/apptheme.dart';
import 'hspace.dart';

Future showConfirmDialog(
    {required BuildContext context,
    required Function() cancelTap,
    required Function() confirmTap,
    required String message,
    String confirmButtonText = "Yes",
    String cancelButtonText = "No"}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          message,
          textAlign: TextAlign.center,
          style: AppTheme.bodyText2.copyWith(fontWeight: FontWeight.w500),
        ),
        content: IntrinsicHeight(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: PrimaryOutlineButton(
                      text: cancelButtonText,
                      onTap: () {
                        cancelTap();
                      },
                      textColor: AppColors.black,
                      outlineColor: const Color(0xffD9D9D9),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  const Hspace(8),
                  Expanded(
                    child: PrimaryButton(
                      text: confirmButtonText,
                      onTap: () {
                        confirmTap();
                      },
                      padding: EdgeInsets.zero,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
