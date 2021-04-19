import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cinema/common/utils/currency_formatter.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:flutter_cinema/presentation/theme/theme_text.dart';

final double defaultHeightTextField = 70.0;

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  final bool readOnly;
  final String label;
  final String initValue;
  final bool obscureText;
  final bool editable;
  final TextInputType inputType;
  final TextInputAction inputAction;
  TextStyle textStyle;
  final TextStyle labelStyle;
  final TextEditingController controller;
  final TextAlignVertical textAlignVertical;
  final EdgeInsets contentPadding;
  final int maxLines;
  final int minLines;
  final Widget prefixWidget;
  final Widget suffixWidget;
  FocusNode focusNode;
  final int maxLength;
  List<TextInputFormatter> formatters;
  final Function(String) validator;
  final Function(String) onSaved;
  final Function onTap;
  final Function(String) onSubmitted;
  final Function(String) onChanged;
  final Function onEditingComplete;
  final bool allowCopyPaste;
  final String hintText;
  final bool autoFocus;
  TextCapitalization textCapitalization;
  final FloatingLabelBehavior floatingLabelBehavior;
  final InputDecoration decoration;
  final bool haveBorder;
  final double customHeightTextField;
  final TextAlign textAlign;
  final TextStyle hintStyle;
  final bool isDense;
  final List<TextInputFormatter> customFormatters;

  TextFieldWidget({
    Key key,
    @required this.label,
    @required this.onSaved,
    this.controller,
    this.initValue,
    this.validator,
    this.obscureText = false,
    this.editable = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.done,
    this.textAlignVertical = TextAlignVertical.center,
    this.contentPadding = const EdgeInsets.only(
      top: 0,
      bottom: 7,
      left: 0,
      right: 0,
    ),
    this.maxLines = 1,
    this.minLines = 1,
    this.prefixWidget,
    this.suffixWidget,
    this.focusNode,
    this.onSubmitted,
    this.maxLength,
    this.onTap,
    this.onChanged,
    this.allowCopyPaste = true,
    this.hintText,
    this.autoFocus = false,
    this.readOnly = false,
    this.labelStyle,
    this.textStyle,
    this.onEditingComplete,
    this.textCapitalization,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.decoration,
    this.haveBorder = true,
    this.customHeightTextField,
    this.textAlign = TextAlign.start,
    this.hintStyle,
    this.isDense = false,
    this.customFormatters,
  }) : super(key: key) {
    textStyle = textStyle ?? TextTheme().input.copyWith(color: Colors.black);
    formatters = [
      _Utf8LengthLimitingTextInputFormatter(maxLength),
    ];
  }

  TextFieldWidget.payment({
    Key key,
    @required this.label,
    @required this.onSaved,
    this.controller,
    this.initValue,
    this.validator,
    this.obscureText = false,
    this.editable = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.done,
    this.textAlignVertical = TextAlignVertical.center,
    this.contentPadding = const EdgeInsets.only(
      top: 0,
      bottom: 7,
      left: 0,
      right: 0,
    ),
    this.maxLines = 1,
    this.minLines = 1,
    this.prefixWidget,
    this.suffixWidget,
    this.focusNode,
    this.onEditingComplete,
    this.onSubmitted,
    this.maxLength,
    this.onTap,
    this.onChanged,
    this.allowCopyPaste = true,
    this.hintText,
    this.autoFocus = false,
    this.readOnly = false,
    this.labelStyle,
    this.textStyle,
    this.textCapitalization,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.decoration,
    this.haveBorder = true,
    this.customHeightTextField,
    this.textAlign = TextAlign.start,
    this.hintStyle,
    this.isDense = false,
    this.customFormatters,
  }) : super(key: key) {
    textStyle = textStyle ?? TextTheme().input.copyWith(color: Colors.black);
    formatters = [
      FilteringTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(12),
      CurrencyFormatter(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: customHeightTextField != null
          ? customHeightTextField
          : defaultHeightTextField,
      child: TextFormField(
        readOnly: readOnly,
        keyboardType: inputType,
        textInputAction: inputAction,
        controller: controller,
        autocorrect: false,
        autofocus: autoFocus,
        autovalidate: false,
        enableSuggestions: false,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        obscureText: obscureText,
        cursorColor: AppColor.primaryColor,
        cursorWidth: 1.2,
        style: textStyle,
        onEditingComplete: onEditingComplete,
        textAlignVertical: textAlignVertical,
        onFieldSubmitted: onSubmitted,
        focusNode: focusNode,
        enableInteractiveSelection: allowCopyPaste,
        onTap: onTap,
        onSaved: onSaved,
        validator: validator,
        onChanged: onChanged,
        textAlign: textAlign,
        enabled: editable,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        inputFormatters: customFormatters ?? formatters,
        decoration: decoration ??
            InputDecoration(
              isDense: isDense,
              counterText: '',
              labelText: label,
              labelStyle: labelStyle ?? TextTheme().inputLabel,
              hintText: hintText,
              hintStyle: hintStyle ?? TextTheme().input,
              suffixIcon: suffixWidget,
              prefixIcon: prefixWidget,
              contentPadding: contentPadding,
              floatingLabelBehavior: floatingLabelBehavior,
              errorStyle: TextTheme().textStyleInputError,
              enabledBorder: !haveBorder
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: AppColor.border,
                      ),
                    ),
              disabledBorder: !haveBorder
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: AppColor.border,
                      ),
                    ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 0.5,
                  color: AppColor.red,
                ),
              ),
              focusedBorder: !haveBorder
                  ? InputBorder.none
                  : const UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: AppColor.primaryColor,
                      ),
                    ),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 0.5,
                  color: AppColor.red,
                ),
              ),
            ),
      ),
    );
  }
}

class _Utf8LengthLimitingTextInputFormatter extends TextInputFormatter {
  _Utf8LengthLimitingTextInputFormatter(this.maxLength)
      : assert(maxLength == null || maxLength == -1 || maxLength > 0);

  final int maxLength;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (maxLength != null &&
        maxLength > 0 &&
        _bytesLength(newValue.text) > maxLength) {
      // If already at the maximum and tried to enter even more, keep the old value.
      if (_bytesLength(oldValue.text) == maxLength) {
        return oldValue;
      }
      return _truncate(newValue, maxLength);
    }
    return newValue;
  }

  TextEditingValue _truncate(TextEditingValue value, int maxLength) {
    var newValue = '';
    if (_bytesLength(value.text) > maxLength) {
      var length = 0;

      value.text.characters.takeWhile((char) {
        var nbBytes = _bytesLength(char);
        if (length + nbBytes <= maxLength) {
          newValue += char;
          length += nbBytes;
          return true;
        }
        return false;
      });
    }
    return TextEditingValue(
      text: newValue,
      selection: value.selection.copyWith(
        baseOffset: min(value.selection.start, newValue.length),
        extentOffset: min(value.selection.end, newValue.length),
      ),
      composing: TextRange.empty,
    );
  }

  int _bytesLength(String value) {
    return utf8.encode(value).length;
  }
}
