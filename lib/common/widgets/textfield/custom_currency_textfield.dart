import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../core/style/app_color.dart';

class CustomCurrencyTextField extends StatefulWidget {
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
  CustomCurrencyTextField({
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
  State<CustomCurrencyTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomCurrencyTextField> {
  static const _locale = 'id';
  String _formatNumber(String s) => NumberFormat.decimalPattern(_locale).format(int.parse(s));

  @override
  void initState() {
    if(widget.controller != null && widget.controller!.text.isNotEmpty) {
      var val = _formatNumber(widget.controller!.text.replaceAll('.', ''));
      widget.controller!.value = TextEditingValue(
        text: val,
        selection: TextSelection.collapsed(offset: val.length),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      maxLines: widget.maxLength,
      textInputAction: widget.textInputAction,
      keyboardType: TextInputType.number,
      readOnly: widget.readOnly,
      obscureText: widget.obscureText,
      focusNode: widget.focusNode,
      inputFormatters: [CurrencyTextInputFormatter(locale: 'id', decimalDigits: 0, symbol: '')],
      onFieldSubmitted: widget.onFieldSubmitted,
      onTap: widget.onTap,
      onChanged: (val){
        debugPrint(val);
      },
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
