import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/style/app_color.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final int maxLength;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? hintColor, fillColor;
  final TextInputType? textInputType;
  bool obscureText;
  final bool isPassword;
  final bool isDisabled;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final dynamic Function()? onTap;
  CustomTextField({
    Key? key,
    required this.hintText,
    this.inputFormatters,
    this.hintColor,
    this.suffixIcon,
    this.fillColor,
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.isDisabled = false,
    this.readOnly = false,
    this.isPassword = false,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.name,
    this.maxLength = 1,
    this.controller,
    this.focusNode,
    this.onFieldSubmitted,
    this.onTap,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      maxLines: widget.maxLength,
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      readOnly: widget.readOnly,
      obscureText: widget.obscureText,
      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatters ?? [],
      onFieldSubmitted: widget.onFieldSubmitted,
      onTap: widget.onTap,
      decoration: InputDecoration(
        fillColor: widget.fillColor,
        enabled: !widget.isDisabled,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: widget.hintColor ?? AppColor.thirdColor60,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon ??
            (widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.obscureText = !widget.obscureText;
                      });
                    },
                    icon: Icon(
                      widget.obscureText
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  )
                : null),
      ),
    );
  }
}
