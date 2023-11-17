import 'package:architecture/core/presentation/widgets/border_textfield.dart';
import 'package:architecture/core/presentation/widgets/primary_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/images.dart';
import '../../theme/app_color.dart';
import '../../theme/apptheme.dart';
import 'hspace.dart';
import 'vspace.dart';

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

showPaymentFailedDialog(
    {required BuildContext context,
    required Function() cancelTap,
    required Function() tryAgain}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        // insetPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.paymentfail),
            const Vspace(19),
            Text(
              'Payment Failed',
              textAlign: TextAlign.center,
              style: AppTheme.bodyText2
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 18.sp),
            ),
            const Vspace(6),
            Text(
              'Payment did not complete',
              textAlign: TextAlign.center,
              style: AppTheme.bodyText2
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 14.sp),
            ),
            const Vspace(35),
            Row(
              children: [
                Expanded(
                  child: PrimaryOutlineButton(
                    text: "No",
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
                    text: "Yes",
                    onTap: () {
                      tryAgain();
                    },
                    padding: EdgeInsets.zero,
                  ),
                )
              ],
            )
          ],
        ),
      );
    },
  );
}

showPaymentSuccessDialog(
    {required BuildContext context,
    required Function() doneTap,
    required Function() emailTap}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        // insetPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(AppImages.paymentsuccess),
            const Vspace(19),
            Text(
              'Successfully Paid',
              textAlign: TextAlign.center,
              style: AppTheme.bodyText2
                  .copyWith(fontWeight: FontWeight.w700, fontSize: 18.sp),
            ),
            const Vspace(6),
            Text(
              'Your payment for event has been processed successfully.',
              textAlign: TextAlign.center,
              style: AppTheme.bodyText2
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 14.sp),
            ),
            const Vspace(13),
            Text(
              'A ticket has been sent to your email',
              textAlign: TextAlign.center,
              style: AppTheme.bodyText2.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: const Color(0xff007628)),
            ),
            const Vspace(35),
            Row(
              children: [
                Expanded(
                  child: PrimaryOutlineButton(
                    text: "Done",
                    onTap: () {
                      doneTap();
                    },
                    textColor: AppColors.black,
                    outlineColor: const Color(0xffD9D9D9),
                    padding: EdgeInsets.zero,
                  ),
                ),
                const Hspace(8),
                Expanded(
                  child: PrimaryButton(
                    text: "Go to email",
                    onTap: () {
                      emailTap();
                    },
                    padding: EdgeInsets.zero,
                  ),
                )
              ],
            )
          ],
        ),
      );
    },
  );
}

reportDialog(
    {required BuildContext context,
    required Function() cancelTap,
    required Function() reportTap,
    required Function(dynamic) onChange}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        content: IntrinsicHeight(
          child: Column(
            children: [
              Text(
                'Report Article',
                textAlign: TextAlign.center,
                style: AppTheme.bodyText2
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              const Vspace(10),
              Text(
                'Send a complaint to us about what you disliked about the article',
                textAlign: TextAlign.center,
                style: AppTheme.bodyText3.copyWith(fontWeight: FontWeight.w500),
              ),
              const Vspace(10),
              BorderedTextFormField(
                hintText: "",
                underlinedBorder: false,
                maxline: 8,
                onChange: onChange,
              ),
              const Vspace(10),
              Row(
                children: [
                  Expanded(
                    child: PrimaryOutlineButton(
                      text: "Cancel",
                      fontsize: 16.sp,
                      onTap: () {
                        cancelTap();
                      },
                      textColor: AppColors.primary,
                      outlineColor: AppColors.primary,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  const Hspace(8),
                  Expanded(
                    child: PrimaryButton(
                      text: "Report",
                      fontsize: 16.sp,
                      fontWeight: FontWeight.w700,
                      onTap: () {
                        reportTap();
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

showStCoinDilog(
    {required BuildContext context,
    required Function() cancelTap,
    required Function()? purchaseTap,
    required Function(dynamic) onChange}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        content: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: () {
                      context.router.pop();
                    },
                    child: const Icon(Icons.close)),
              ),
              SizedBox(
                height: 104,
                child: Stack(
                  fit: StackFit.passthrough,
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AppImages.bigcoinbg,
                    ),
                    Image.asset(
                      AppImages.bigrupee,
                    ),
                  ],
                ),
              ),
              const Vspace(10),
              Text(
                'Get St. Coins Now!',
                textAlign: TextAlign.center,
                style: AppTheme.bodyText3
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 24),
              ),
              const Vspace(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text("Quantity:",
                        style: AppTheme.bodyText3.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 18)),
                    const Hspace(8),
                    Expanded(
                      child: BorderedTextFormField(
                        hintText: "",
                        maxLength: 8,
                        underlinedBorder: false,
                        borderColor: const Color(0xffE24653),
                        keyboardType: TextInputType.number,
                        maxline: 1,
                        onChange: onChange,
                      ),
                    ),
                  ],
                ),
              ),
              const Vspace(32),
              Row(
                children: [
                  Expanded(
                    child: PrimaryOutlineButton(
                      text: "Cancel",
                      fontsize: 15.sp,
                      onTap: cancelTap,
                      textColor: const Color(0xFF676767),
                      outlineColor: const Color(0xFFCCCCCC),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  const Hspace(8),
                  Expanded(
                    child: PrimaryButton(
                      text: "Purchase",
                      fontsize: 15.sp,
                      fontWeight: FontWeight.w700,
                      onTap: purchaseTap,
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
