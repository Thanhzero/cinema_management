import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_cinema/common/constants/currency_constants.dart';

class CurrencyFormatter extends TextInputFormatter {
  NumberFormat numberFormat;
  final double maxDigits;

  CurrencyFormatter({
    this.numberFormat,
    this.maxDigits = 12,
  }) {
    numberFormat ??= CurrencyConstants.viFormatter;
  }

  int get _getOffset {
    return 2;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    if (maxDigits != null && newValue.selection.baseOffset > maxDigits) {
      return oldValue;
    }
    final double value = double.parse(newValue.text);

    final formattedValue = numberFormat.format(value);
    return newValue.copyWith(
      text: formattedValue,
      selection:
          TextSelection.collapsed(offset: formattedValue.length - _getOffset),
    );
  }
}
