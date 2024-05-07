import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zexonline/src/utils/app_colors.dart';

enum BorderInput { NONE, UNDERLINE, BORDER }

class TextFormFieldCommon extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final bool obscureText;
  final List<TextInputFormatter> inputFormatters;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validation;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final void Function(String value)? onChanged;
  final void Function(String? value)? onSaved;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onPressed;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final EdgeInsetsGeometry? paddingIcEye;
  final TextStyle? textStyle;
  final Widget? suffixIcon;
  final VoidCallback? onTapSuffixIcon;
  final Widget? prefixIcon;
  final bool enableInteractiveSelection;
  final double borderRadius;
  final bool readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final String? label;
  final String subLabel;
  final bool showIcEyes;
  final BorderInput border;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final double? titleFontSize;
  final Color? labelColorOffont;
  final String? hintText;
  final TextStyle? errorStyle;
  final bool isDisabled;
  final Color? colorText;
  final int maxLines;
  final int minLines;
  final double fontSize;

  const TextFormFieldCommon({
    super.key,
    this.controller,
    this.initialValue,
    this.obscureText = false,
    this.inputFormatters = const [],
    this.focusNode,
    this.validation,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.onSaved,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onPressed,
    this.margin,
    this.padding,
    this.textStyle,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.prefixIcon,
    this.enableInteractiveSelection = true,
    this.borderRadius = 10,
    this.readOnly = false,
    this.contentPadding,
    this.label,
    this.subLabel = '',
    this.showIcEyes = false,
    this.border = BorderInput.UNDERLINE,
    this.labelStyle,
    this.titleFontSize,
    this.labelColorOffont,
    this.paddingIcEye,
    this.hintText,
    this.hintStyle,
    this.errorStyle,
    this.isDisabled = false,
    this.colorText,
    this.maxLines = 1,
    this.minLines = 1,
    this.fontSize = 18,
  });

  @override
  State<TextFormFieldCommon> createState() => _TextFormFieldCommonState();
}

class _TextFormFieldCommonState extends State<TextFormFieldCommon> {
  bool isTopLabel = false;

  late final FocusNode _focusNode;
  late TextEditingController _controller;

  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? TextEditingController();
    _focusNode.addListener(_listener);
    widget.controller?.addListener(_listener);
    isTopLabel = _focusNode.hasFocus || _controller.text.isNotEmpty;
    super.initState();
  }

  _listener() {
    if (mounted) {
      setState(() {
        isTopLabel = _focusNode.hasFocus || _controller.text.isNotEmpty;
      });
    }
  }

  @override
  void didUpdateWidget(covariant TextFormFieldCommon oldWidget) {
    if (widget.controller != oldWidget.controller) {
      _controller = widget.controller ?? TextEditingController();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.label == null) {
      return Container(margin: widget.margin, child: textFormField);
    }
    return Container(
      margin: widget.margin,
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: textFormField,
          ),
          AnimatedPadding(
            padding: EdgeInsets.only(top: isTopLabel ? 12 : 15, left: 10),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Text.rich(
              TextSpan(
                text: widget.label ?? '',
                style: widget.labelStyle ??
                    GoogleFonts.cabin(
                      color: AppColors.black,
                      fontSize: isTopLabel ? 12 : 14,
                    ),
                children: [
                  TextSpan(
                    text: ' ${widget.subLabel}',
                    style:
                        GoogleFonts.cabin(color: AppColors.black, fontSize: isTopLabel ? 12 : 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get textFormField => TextFormField(
        style: GoogleFonts.cabin(
          fontSize: widget.fontSize,
          color: widget.colorText ??
              (widget.isDisabled ? AppColors.black.withOpacity(.3) : AppColors.black),
        ),
        onTap: widget.isDisabled ? null : widget.onPressed,
        focusNode: _focusNode,
        validator: widget.validation,
        controller: _controller,
        obscureText: _obscureText,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        cursorColor: AppColors.black,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        decoration: decoration,
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onFieldSubmitted,
        readOnly: widget.readOnly,
        obscuringCharacter: '*',
        maxLines: widget.maxLines,
        minLines: widget.minLines,
      );

  InputDecoration get decoration => InputDecoration(
        filled: true,
        fillColor: AppColors.white,
        border: widget.border == BorderInput.UNDERLINE
            ? const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.black))
            : widget.border == BorderInput.BORDER
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: const BorderSide(color: AppColors.black, width: 1.0),
                  )
                : const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: widget.border == BorderInput.UNDERLINE
            ? const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.black))
            : widget.border == BorderInput.BORDER
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: const BorderSide(color: AppColors.black, width: 1.0),
                  )
                : const OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: widget.border == BorderInput.UNDERLINE
            ? const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.black))
            : widget.border == BorderInput.BORDER
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: const BorderSide(color: AppColors.black, width: 1.0),
                  )
                : const OutlineInputBorder(borderSide: BorderSide.none),
        errorBorder: widget.border == BorderInput.UNDERLINE
            ? const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.black))
            : widget.border == BorderInput.BORDER
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: const BorderSide(color: AppColors.black, width: 1.0),
                  )
                : const OutlineInputBorder(borderSide: BorderSide.none),
        focusedErrorBorder: widget.border == BorderInput.UNDERLINE
            ? const UnderlineInputBorder(borderSide: BorderSide(color: AppColors.black))
            : widget.border == BorderInput.BORDER
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    borderSide: const BorderSide(color: AppColors.black, width: 1.0),
                  )
                : const OutlineInputBorder(borderSide: BorderSide.none),
        contentPadding:
            widget.contentPadding ?? const EdgeInsets.only(top: 26, bottom: 10, left: 10),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        isDense: true,
        isCollapsed: true,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? TextStyle(color: AppColors.black.withOpacity(0.3)),
        errorStyle: widget.errorStyle ?? const TextStyle(color: AppColors.red),
        errorMaxLines: 2,
      );
}
