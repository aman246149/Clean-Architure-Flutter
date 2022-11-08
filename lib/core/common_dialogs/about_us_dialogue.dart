import 'package:architecture/core/common_dialogs/policydialog/policy_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/widgets/vspace.dart';
import 'common_dialog.dart';

void showDialogData(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) {
        return SimpleDialog(
          backgroundColor: Colors.black,
          title: Text(
            "About Us",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                  fontSize: 14,
                ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DialogRowWidget(
                    context: context,
                    text: "Privacy Policy",
                    icon: Icons.privacy_tip_outlined,
                    ontap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return PolicyDialog(
                            mdFileName: 'privacy.md',
                          );
                        },
                      );
                    },
                  ),
                  Vspace(8),
                  DialogRowWidget(
                    context: context,
                    icon: Icons.control_point_duplicate_outlined,
                    text: "Terms & Condition",
                    ontap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return PolicyDialog(
                            mdFileName: 'terms.md',
                          );
                        },
                      );
                    },
                  ),
                  Vspace(8),
                  DialogRowWidget(
                    context: context,
                    icon: Icons.person,
                    text: "About App",
                    ontap: () {
                      Navigator.pop(context);
                      showCommonDialog(context, "About App",
                          "This app is made for people who want to watch best seies without wasting any time in searching for good series .");
                    },
                  ),
                  Vspace(8),
                  DialogRowWidget(
                    context: context,
                    text: "Acknowledgment",
                    icon: Icons.ac_unit_outlined,
                    ontap: () {
                      Navigator.pop(context);
                      showCommonDialog(context, "Acknowledgment",
                          "Thanks you.. unsplash ,pexels,pixabay,freepick,https://wall.alphacoders.com/ (wall alphacoder) and other respective websites");
                    },
                  ),
                  Vspace(8),
                  DialogRowWidget(
                    context: context,
                    text: "Sign Out",
                    icon: Icons.logout_outlined,
                    ontap: () {
                      // context.read<AuthBloc>().add(AuthSighOut());
                      // context.router.replaceAll([LoginScreenRoute()]);
                    },
                  ),
                  Vspace(8),
                  Vspace(4),
                ],
              ),
            )
          ],
        );
      });
}

class DialogRowWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() ontap;
  const DialogRowWidget({
    Key? key,
    required this.context,
    required this.text,
    required this.icon,
    required this.ontap,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          ),
          Icon(
            icon,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
