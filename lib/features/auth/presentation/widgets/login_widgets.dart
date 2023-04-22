import 'package:architecture/core/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/presentation/widgets/border_textfield.dart';
import '../../../../core/presentation/widgets/custom_container.dart';
import '../../../../core/presentation/widgets/custom_text.dart';
import '../../../../core/presentation/widgets/hspace.dart';
import '../../../../core/presentation/widgets/vspace.dart';

class SocialHandles extends StatelessWidget {
  const SocialHandles({
    super.key,
    required this.path,
  });
  final String path;
  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
        ),
        containerColor: const Color(0XFF191B1C),
        borderColor: Colors.white.withOpacity(0.12),
        child: path.contains("jpg") || path.contains("png")
            ? Image.asset(
                path,
                height: 22,
              )
            : SvgPicture.asset(
                path,
                height: 22,
              ));
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.isIconRequired = false,
      this.hideText,
      this.hidePassword = false,
      this.validator,
      this.textInputType,
      this.controller});
  final String hintText;
  final bool? isIconRequired;
  final Function()? hideText;
  final bool? hidePassword;
  final String Function(dynamic)? validator;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      borderColor: Colors.white.withOpacity(0.12),
      containerColor: const Color(0xff191B1C),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: BorderedTextFormField(
              hintText: hintText,
              obscureText: hidePassword!,
              validator: validator,
              controller: controller,
              keyboardType: textInputType,
            ),
          ),
          isIconRequired!
              ? GestureDetector(
                  onTap: () {
                    hideText!();
                  },
                  child: SvgPicture.asset(
                      hidePassword! ? AppIcons.eyeClose : AppIcons.eye))
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

class TextLabel extends StatelessWidget {
  const TextLabel({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.opacity = 0.92,
    this.fontWeight = FontWeight.w400,
  });
  final String text;
  final double? fontSize;
  final double? opacity;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: text,
      fontSize: 14,
      fontWeight: fontWeight,
      color: Colors.white.withOpacity(opacity!),
    );
  }
}

class CommonDivider extends StatelessWidget {
  const CommonDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.white.withOpacity(0.16),
    );
  }
}

class ValidationError extends StatelessWidget {
  const ValidationError({
    super.key,
    required this.error,
  });
  final String error;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Vspace(4),
        Row(
          children: [
            SvgPicture.asset(AppIcons.i),
            const Hspace(6),
            TextWidget(
              text: error,
              color: const Color(0xffEC5E61),
              fontSize: 12,
            )
          ],
        ),
      ],
    );
  }
}

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget(
      {super.key,
      required this.onTap,
      required this.first,
      required this.second,
      this.mainAxisAlignment = MainAxisAlignment.center});
  final Function() onTap;
  final String first;
  final String second;
  final MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Row(
        mainAxisAlignment: mainAxisAlignment!,
        children: [
          TextWidget(
            text: first,
            fontSize: 14,
            color: Colors.white.withOpacity(0.64),
          ),
          TextWidget(
            text: second,
            fontSize: 14,
            color: const Color(0xffE8AE56),
          ),
        ],
      ),
    );
  }
}

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: CommonDivider()),
        TextWidget(
          text: "Or",
          color: Colors.white.withOpacity(0.54),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        const Expanded(child: CommonDivider()),
      ],
    );
  }
}
