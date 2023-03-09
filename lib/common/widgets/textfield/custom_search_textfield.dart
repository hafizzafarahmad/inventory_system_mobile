import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textfield_search/textfield_search.dart';

import '../../../core/style/app_color.dart';

class CustomSearchTextField extends StatefulWidget {
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
  final List<dynamic> listData;
  final Function loadData;
  CustomSearchTextField({
    Key? key,
    required this.hintText,
    required this.listData,
    required this.loadData,
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
  }) : super(key: key);

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldSearch(
      controller: widget.controller!,
      initialList: widget.listData,
      getSelectedValue: (item) {
        print(item);
      },
      future: (){
        return widget.loadData();
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
      ), label: '',
    );
  }
}
