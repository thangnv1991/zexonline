import 'package:flutter/material.dart';
import 'package:zexonline/src/utils/app_colors.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    this.hintText = '',
    this.isPassword = false,
    this.hasIconShowPassword = false,
    this.isCircle = false,
    this.errors = const <String>[],
    this.controller,
    this.onChanged,
    this.onTap,
    this.onCompleted,
    this.keyboardType = TextInputType.text,
    this.borderRadius = 30,
    this.maxLength = 255,
    this.height = 110,
    this.errorStyle,
    this.hintStyle,
    super.key,
  });

  final TextStyle? hintStyle;
  final String hintText;
  final bool isPassword;
  final bool hasIconShowPassword;
  final bool isCircle;
  final List<String> errors;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final void Function(String)? onCompleted;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final double borderRadius;
  final int maxLength;
  final double height;
  final TextStyle? errorStyle;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return widget.keyboardType == TextInputType.multiline
        ? _buildMultipleLineTextField()
        : _buildSingleLineTextField();
  }

  _buildSingleLineTextField() {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          padding: widget.isCircle ? null : const EdgeInsets.symmetric(horizontal: 22),
          height: 50,
          width: widget.isCircle ? 50 : double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              border: Border.all(color: AppColors.primary)),
          child: TextField(
            onTap: widget.onTap,
            onSubmitted: widget.onCompleted,
            obscureText: widget.isPassword ? _obscureText : false,
            onChanged: (value) {
              setState(() {
                if (widget.errors.isNotEmpty) {
                  widget.errors.clear();
                }
              });
              widget.onChanged != null ? widget.onChanged!(value) : null;
            },
            controller: widget.controller,
            decoration: InputDecoration(
                suffixIcon: (widget.isPassword && widget.hasIconShowPassword)
                    ? IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                        ),
                        color: AppColors.primary,
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : null,
                suffixIconConstraints: const BoxConstraints(maxWidth: 24),
                border: InputBorder.none,
                counterText: '',
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ?? TextStyle(color: AppColors.black.withOpacity(0.3))),
            keyboardType: widget.keyboardType,
            // style: widget.isCircle ? largeGreyBold : mediumGreyNormal,
            textAlign: widget.isCircle ? TextAlign.center : TextAlign.start,
            maxLength: widget.isCircle ? 1 : widget.maxLength,
          ),
        ),
        Visibility(
          visible: widget.errors.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Column(
              children: widget.errors
                  .map((e) => Align(
                      alignment: Alignment.centerLeft,
                      child: Text(e,
                          style: widget.errorStyle ?? const TextStyle(color: AppColors.red))))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }

  _buildMultipleLineTextField() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: widget.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.primary)),
          child: TextField(
            onTap: widget.onTap,
            onChanged: (value) {
              setState(() {
                if (widget.errors.isNotEmpty) {
                  widget.errors.clear();
                }
              });
              widget.onChanged != null ? widget.onChanged!(value) : null;
            },
            // onChanged: widget.onChanged,
            controller: widget.controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                counterText: '',
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ?? TextStyle(color: AppColors.black.withOpacity(0.3))),
            keyboardType: TextInputType.multiline,
            // style: mediumGreyNormal,
            maxLines: 5,
            minLines: 1,
          ),
        ),
        Visibility(
          visible: widget.errors.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Column(
              children: widget.errors
                  .map((e) => Align(
                      alignment: Alignment.centerLeft,
                      child: Text(e,
                          style: widget.errorStyle ?? const TextStyle(color: AppColors.red))))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
