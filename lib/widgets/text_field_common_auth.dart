import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:reqresz/core/theme/app_css.dart';

import '../config.dart';

class TextFieldCommonAuth extends StatefulWidget {
  final String hintText;
  final String? name;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Color? fillColor;
  final bool obscureText, isMaxLine;
  final double? vertical, radius, hPadding;
  final InputBorder? border;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final int? maxLength, minLines, maxLines;
  final String? counterText, prefixIcon;
  final TextStyle? hintStyle;
  final bool? isNumber;
  final ValueChanged<String?>? onChanged;
  final GestureTapCallback? onTap;

  const TextFieldCommonAuth({super.key,
    required this.hintText,
    this.validator,
    this.name,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.border,
    this.obscureText = false,
    this.fillColor,
    this.vertical,
    this.keyboardType,
    this.focusNode,
    this.radius,
    this.isNumber = false,
    this.maxLength,
    this.minLines,
    this.autovalidateMode,
    this.maxLines,
    this.counterText,
    this.hintStyle,
    this.hPadding,
    this.isMaxLine = false,
    this.onTap,
    this.onChanged});

  @override
  State<TextFieldCommonAuth> createState() => _TextFieldCommonAuthState();
}

class _TextFieldCommonAuthState extends State<TextFieldCommonAuth> {
  bool isFocus = false;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name!,
      maxLines: widget.maxLines ?? 1,
      style:
      appCss.jakartaMedium14.textColor(appTheme.darkText),
      focusNode: widget.focusNode,
      obscureText: widget.obscureText,
      onTap: widget.onTap,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      controller: widget.controller,
      minLines: widget.minLines,
      autovalidateMode: widget.autovalidateMode,
      cursorColor: appTheme.darkText,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          counterText: widget.counterText,
          fillColor: widget.fillColor ?? appTheme.white,
          filled: true,
          isDense: true,
          disabledBorder: widget.border ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius ?? AppRadius.r10)),
                  borderSide: BorderSide(color: appTheme.grey85)),
          focusedBorder: widget.border ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius ?? AppRadius.r10)),
                  borderSide: BorderSide(color: appTheme.primary)),
          enabledBorder: widget.border ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius ?? AppRadius.r10)),
                  borderSide: BorderSide(color: appTheme.grey85)),
          border: widget.border ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(widget.radius ?? AppRadius.r10)),
                  borderSide: BorderSide(color: appTheme.grey85)),
          contentPadding: widget.isMaxLine
              ? const EdgeInsets.only(
              left: Sizes.s45,
              right: Insets.i15,
              top: Insets.i10,
              bottom: Insets.i10)
              : EdgeInsets.symmetric(
              horizontal: widget.hPadding ?? Insets.i15,
              vertical: widget.vertical ?? Insets.i15),
          hintStyle: widget.hintStyle ??
              appCss.jakartaMedium14.textColor(appTheme.grey75),
          hintText: widget.hintText,
          errorMaxLines: 1),
    );
  }
}
