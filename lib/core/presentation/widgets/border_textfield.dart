import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class BorderedTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final ValueChanged? onChange;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final int? maxLength;
  final bool? enabled;
  final int? maxline;
  final Color? hintColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final bool underlinedBorder;
  final bool noBorder;
  final int? minLines;
  final Color? borderColor;
  final Function(String)? onFieldSubmitted;
  final Function()? onTap;
  final TextStyle? textStyle;
  final EdgeInsets? contentPadding;
  final bool isBuiltCounterRequired;
  final bool readOnly;
  final TextAlign? textAlign;
  const BorderedTextFormField(
      {this.readOnly = false,
      required this.hintText,
      this.isBuiltCounterRequired = false,
      this.onTap,
      this.borderColor,
      this.controller,
      this.validator,
      this.onChange,
      this.keyboardType,
      this.textInputAction,
      this.prefix,
      this.maxLength,
      this.obscureText = false,
      this.underlinedBorder = false,
      this.noBorder = false,
      this.enabled = true,
      super.key,
      this.maxline = 1,
      this.minLines,
      this.suffix,
      this.hintColor,
      this.inputFormatters,
      this.hintStyle,
      this.focusNode,
      this.onFieldSubmitted,
      this.textStyle,
      this.contentPadding,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: readOnly,
      scrollPadding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      focusNode: focusNode,
      textAlign: textAlign!,
      buildCounter: isBuiltCounterRequired
          ? (BuildContext context,
              {required int currentLength,
              required bool isFocused,
              required int? maxLength}) {
              return Text(
                  "${currentLength.toString()}/${maxLength.toString()}");
            }
          : null,
      onFieldSubmitted: onFieldSubmitted,
      style: textStyle ??
          Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.black.withOpacity(0.7),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400),
      enabled: enabled,
      minLines: minLines,
      maxLines: maxline,
      maxLength: maxLength,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      onChanged: onChange,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          errorMaxLines: 2,
          suffixIcon: suffix,
          filled: true,
          prefixIcon: prefix,
          fillColor: Colors.transparent,
          focusedBorder: fieldBorder(),
          enabledBorder: fieldBorder(),
          errorBorder: fieldBorder(),
          disabledBorder: fieldBorder(),
          border: fieldBorder(),
          focusedErrorBorder: fieldBorder(),
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
          isDense: true,
          hintText: hintText,
          hintStyle: hintStyle ??
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: hintColor ?? const Color(0xffA9A9A9),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
          counterText: isBuiltCounterRequired ? "" : ""),
    );
  }

  // OutlineInputBorder fieldBorder = OutlineInputBorder(
  //   borderRadius: BorderRadius.circular(4),
  //   borderSide: const BorderSide(width: 0, color: Color(0XFFF5F5F5)),
  // );
  InputBorder fieldBorder() => noBorder
      ? InputBorder.none
      : underlinedBorder
          ? UnderlineInputBorder(
              borderSide:
                  BorderSide(color: borderColor ?? const Color(0xFFD4D4D4)))
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: borderColor ?? const Color(0xFFD4D4D4)));
}
