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
  const BorderedTextFormField(
      {required this.hintText,
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
      Key? key,
      this.maxline = 1,
      this.minLines,
      this.suffix,
      this.hintColor,
      this.inputFormatters,
      this.hintStyle,
      this.focusNode,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.black.withOpacity(0.7),
          fontSize: 16.sp,
          fontWeight: FontWeight.w500),
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
          isDense: true,
          hintText: hintText,
          hintStyle: hintStyle ??
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: hintColor ?? Colors.black.withOpacity(0.44),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300),
          counterText: ""),
    );
  }

  // OutlineInputBorder fieldBorder = OutlineInputBorder(
  //   borderRadius: BorderRadius.circular(4),
  //   borderSide: const BorderSide(width: 0, color: Color(0XFFF5F5F5)),
  // );
  InputBorder fieldBorder() => noBorder
      ? InputBorder.none
      : underlinedBorder
          ? const UnderlineInputBorder()
          : OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:  BorderSide(color:borderColor?? const Color(0xFF808080)));
}
