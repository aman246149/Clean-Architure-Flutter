import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/custom_text.dart';



class SignupPrivacyText extends StatelessWidget {
  const SignupPrivacyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "By signing up you are agreeing to our ",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
        children: <TextSpan>[
          TextSpan(
            text: "Terms and conditions ",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color(0xffE8AE56),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          TextSpan(
            text: "and ",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          TextSpan(
            text: "Privacy policy ",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color(0xffE8AE56),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}



class CommonRadioButton extends StatelessWidget {
  const CommonRadioButton({
    super.key,
    required this.selectedOption,
    required this.text,
    required this.updateRadioState,
    required this.currentlySelectedIndex,
  });

  final int? selectedOption;
  final String text;
  final Function(int) updateRadioState;
  final int currentlySelectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      horizontalTitleGap: 1,
      child: RadioListTile(
        activeColor: const Color(0xffE8AE56),
        toggleable: true,
        title: TextWidget(
          text: text,
          fontSize: 16,
        ),
        value: currentlySelectedIndex,
        visualDensity: VisualDensity.compact,
        contentPadding: EdgeInsets.zero,
        dense: false,
        groupValue: selectedOption,
        onChanged: (value) {
          updateRadioState(selectedOption!);
          print(selectedOption);
        },
      ),
    );
  }
}
