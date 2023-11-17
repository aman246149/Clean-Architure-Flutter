import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import '../constants/images.dart';
import '../presentation/widgets/hspace.dart';
import '../presentation/widgets/vspace.dart';
import 'loader.dart';

// ignore: constant_identifier_names
enum ScreenType { EVENT, GROUPBYIN, STCOINS }

String? capitalizeFirstLetter(String? input) {
  if (input == null || input.isEmpty) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1);
}

String? lowercaseFirstLetter(String? input) {
  if (input == null || input.isEmpty) {
    return input;
  }
  return input[0].toLowerCase() + input.substring(1);
}

void showOverlayLoader(BuildContext context) {
  GetIt.instance<Loader>().showLoader(context);
}

void hideOverlayLoader(BuildContext context) {
  debugPrint("Hiding Loader");
  GetIt.instance<Loader>().hideLoader(context);
}

void showSnackbar(context, String message) {
  Flushbar(
    message: message,
    duration: const Duration(seconds: 3),
  ).show(context);
}

void showErrorSnackbar(context, String message) {
  var title = "Error";
  if (message.isEmpty) return;
  Flushbar(
    title: title,
    backgroundColor: Colors.red,
    message: message,
    duration: const Duration(seconds: 3),
  ).show(context);
}

void showSuccessSnackbar(context, message) {
  var title = "Success";
  Flushbar(
    title: title,
    backgroundColor: Colors.green,
    message: message,
    duration: const Duration(seconds: 3),
  ).show(context);
}

String getPathParamsFromUrl(String uri, Map<String, dynamic> data) {
  List<String> subStrings = uri.split("/");
  var paramIndex = subStrings.indexWhere((element) => element.startsWith(":"));
  subStrings[paramIndex] = data[subStrings[paramIndex].substring(1)].toString();
  return subStrings.join("/");
}

double calculateSizeInMb(sizeInBytes) => sizeInBytes / (1024 * 1024);

String formattedCurrency(num data) =>
    NumberFormat.currency(symbol: "₹").format(data);

DateTime? dateTimeFromString(String? dateTime) {
  return dateTime == null ? null : DateTime.parse(dateTime);
}

DateTime mandatoryDateTimeFromString(String dateTime) {
  return DateTime.parse(dateTime);
}

// String parsedHtmlString(String input) {
//   return parse(input).body?.text ?? '';
// }

String formatDateTimeToMonthYear(DateTime? dateTime) {
  return dateTime == null ? "Present" : DateFormat("MMM yyyy").format(dateTime);
}

String formatDateTimeToDayMonthYear(DateTime? dateTime) {
  return dateTime == null ? "" : DateFormat("dd MMM yyyy").format(dateTime);
}

String formatDateTimeRange(String startDate, String endDate) {
  // Parse the input strings into DateTime objects
  DateTime startDateTime = DateTime.parse(startDate);
  DateTime endDateTime = DateTime.parse(endDate);

  // Define date and time formatters
  final dateFormatter = DateFormat('d MMM');
  final timeFormatter = DateFormat('h:mm a');

  // Format the date and time components
  String startDayMonth = dateFormatter.format(startDateTime);
  String endDayMonth = dateFormatter.format(endDateTime);
  String startTime = timeFormatter.format(startDateTime);
  String endTime = timeFormatter.format(endDateTime);

  // Build the formatted string
  String formattedString =
      '$startDayMonth - $endDayMonth | $startTime - $endTime';

  return formattedString;
}

List<String> commonEmailDomains = [
  'gmail.com',
  'yahoo.com',
  'outlook.com',
  'hotmail.com',
  'aol.com',
  'icloud.com',
  'protonmail.com',
  'yandex.com',
  'mail.com',
  'zoho.com',
  'gmx.com',
  'fastmail.com',
  'live.com',
  'me.com',
  'qq.com',
  '163.com',
  'rediffmail.com',
  'indiatimes.com',
  'rocketmail.com',
  'inbox.com',
  'yopmail.com'
];

// Future<void> showSuccessMessage(BuildContext context,
//     {String message = "Action Successful!"}) async {
//   await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//             contentPadding: const EdgeInsets.all(16),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Align(
//                     alignment: Alignment.topRight,
//                     child: IconButton(
//                         onPressed: () {
//                           context.router.pop();
//                         },
//                         icon: const Icon(Icons.close))),
//                 LottieBuilder.asset(
//                   "assets/json/success.json",
//                   repeat: false,
//                 ),
//                 const Vspace(12),
//                 Text(
//                   message,
//                   textAlign: TextAlign.center,
//                   style: AppTheme.bodyText1.copyWith(
//                     fontSize: 17.sp,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ],
//             ),
//           ));
// }

class SignInWithGoogleButton extends StatelessWidget {
  const SignInWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.2)),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.google),
          const Hspace(12),
          const Text("Sign In With Google")
        ],
      ),
    );
  }
}

class EmptyPageGraphic extends StatelessWidget {
  final String message;
  const EmptyPageGraphic(
      {this.message = "No data found!\nPlease check back later!", super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(
              "assets/svg/no-content.svg",
              width: 250,
            ),
            const Vspace(24),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(height: 1.4),
            )
          ],
        ),
      ),
    );
  }
}

//! generate link method

// Future<String> generateLink(BuildContext context, BranchUniversalObject buo,
//     BranchLinkProperties lp, bool shareRequired) async {
//   BranchResponse response =
//       await FlutterBranchSdk.getShortUrl(buo: buo, linkProperties: lp);
//   if (response.success) {
//     if (context.mounted) {
//       print(response.result);
//       hideOverlayLoader(context);
//       if (shareRequired) {
//         Share.share(response.result);
//         return response.result;
//       }
//     }
//     return response.result;
//   } else {
//     hideOverlayLoader(context);
//     print(
//         "  message: 'Error : ${response.errorCode} - ${response.errorMessage}'");
//     return "";
//   }
// }
