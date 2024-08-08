import 'package:flutter/material.dart';

import 'colors.dart';

class InputTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final String errorText;
  final String? prefixText;
  final int maxLines;
  final bool enabled;
  final bool isValid;
  final bool isPrimary;
  final bool showError;
  final bool obscureText;
  final bool? showPrefixText;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final FontWeight fontWeight;
  final TextInputType inputType;
  final TextEditingController controller;
  final Function(String) onChanged;
  final Function(String) onSubmit;
  final Color color;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  InputTextField(
      {required this.title,
      required this.onSubmit,
      required this.onChanged,
      this.prefixIcon,
      this.maxLines = 1,
      this.hintText = '',
      this.errorText = '',
      this.prefixText = '',
      this.isValid = true,
      this.enabled = true,
      this.isPrimary = false,
      this.showError = false,
      this.obscureText = false,
      this.showPrefixText = false,
      this.fontWeight = FontWeight.w400,
      required this.controller,
      this.focusNode,
      this.nextFocusNode,
      this.suffixIcon,
      required this.inputType,
      this.color = TEXT_FIELD_COLOR});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: maxLines > 1 ? null : 50,
          margin: EdgeInsets.only(top: 4.0),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            border:
                Border.all(color: showError ? Colors.red : OFF_WHITE, width: 1),
          ),
          child: Center(
            child: Padding(
              padding: suffixIcon == null
                  ? const EdgeInsets.only(top: 0.0)
                  : const EdgeInsets.only(top: 4.0),
              child: TextField(
                maxLines: maxLines,
                focusNode: focusNode,
                controller: controller,
                keyboardType: inputType,
                obscureText: obscureText,
                enabled: enabled,
                textInputAction: nextFocusNode != null
                    ? TextInputAction.next
                    : TextInputAction.done,
                onSubmitted: (str) => nextFocusNode != null
                    ? nextFocusNode!.nextFocus()
                    : onSubmit(str),
                onChanged: onChanged,
                decoration: InputDecoration(
                  icon: prefixIcon,
                  suffixIcon: suffixIcon,
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: TEXT_FIELD_HINT_COLOR,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Visibility(
            visible: showPrefixText!,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 4.0, bottom: 2.0, right: 2.0, left: 2.0),
              child: Text(
                prefixText!,
                style: TextStyle(
                  fontSize: 10,
                  color: DARK_OFF_FONT,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: showError,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: Text(
              errorText,
              style: TextStyle(
                fontSize: 13,
                color: Colors.red,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
