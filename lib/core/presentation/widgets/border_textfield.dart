import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BorderedTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final ValueChanged? onChange;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefix;
  final bool obscureText;
  final int? maxLength;
  final bool? enabled;
  final int? maxline;
  final Color? hintColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? hintStyle;
  final  FocusNode? focusNode;
  BorderedTextFormField(
      {required this.hintText,
      this.controller,
      this.validator,
      this.onChange,
      this.keyboardType,
      this.textInputAction,
      this.prefix,
      this.maxLength,
      this.obscureText = false,
      this.enabled = true,
      Key? key,
      this.maxline = 1,
      this.hintColor,
      this.inputFormatters,
      this.hintStyle, this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
      enabled: enabled,
      maxLines: maxline,
      maxLength: maxLength,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      onChanged: onChange,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      cursorColor: Colors.white,
      decoration: InputDecoration(
          filled: true,
          prefixIcon: prefix,
          fillColor: Colors.transparent,
          focusedBorder: fieldBorder,
          enabledBorder: fieldBorder,
          errorBorder: fieldBorder,
          disabledBorder: fieldBorder,
          border: fieldBorder,
          focusedErrorBorder: fieldBorder,
          contentPadding: EdgeInsets.zero,
          isDense: true,
          hintText: hintText,
          hintStyle: hintStyle ??
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: hintColor ?? Colors.white.withOpacity(0.64),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
          counterText: ""),
    );
  }

  // OutlineInputBorder fieldBorder = OutlineInputBorder(
  //   borderRadius: BorderRadius.circular(4),
  //   borderSide: const BorderSide(width: 0, color: Color(0XFFF5F5F5)),
  // );
  InputBorder fieldBorder = InputBorder.none;
}
