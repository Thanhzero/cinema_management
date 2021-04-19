import 'package:flutter/cupertino.dart';
import 'package:flutter_cinema/common/utils/validate_utils.dart';

class UnitMaskedTextController extends TextEditingController {
  UnitMaskedTextController(
      {double initialValue = 0.0,
      this.decimalSeparator = '.',
      this.rightSymbol = '',
      this.precision = 2}) {
    this.addListener(() {
      this.updateValue();
    });
    this.initValue(initialValue);
  }

  final String decimalSeparator;
  final String rightSymbol;
  final int precision;

  double _lastValue = 0.0;
  void initValue(double value)
  {
    this.text = (value== 0.0)? '0$rightSymbol':'$value$rightSymbol';
  }
  void updateValue() {
    String zeroFirstPattern = '^0\\d{1}$rightSymbol?\$';
    RegExp zeroFirst = RegExp(zeroFirstPattern);
    if (this.text == rightSymbol) {
      // if number was cleared
      this.text = '0' + rightSymbol;
    } else if (zeroFirst.hasMatch(this.text)) {
      // if old value = 0, replace 0 = new value
      this.text = this.text.substring(1);
    } else if (this.text.contains((decimalSeparator))) {
      //if have decimal number
      List<String> parts = this.text?.split(decimalSeparator)?.toList();
      if (parts.length > 2 ||
          parts[1].length > (precision + rightSymbol.length)) {
        // if decimal number long than precision then keep old value
        if (Validate.validateWeight(this.text) != null) {
          this.text = _lastValue.toString() + rightSymbol;
        }
      }
    }
    _lastValue = this.numberValue;
    var cursorPosition = this.text.length > rightSymbol.length
        ? this.text.length - rightSymbol.length
        : 0;

    this.selection = new TextSelection.fromPosition(
        new TextPosition(offset: cursorPosition));
  }

  double get numberValue {
    try {
      String numberPattern = '^\\d*(,|.)?\\d{0,$precision}';
      final regexp = RegExp(numberPattern);
      final match = regexp.firstMatch(this.text);
      final number = match.group(0);
      return double.parse(number);
    } catch (_) {
      return 0;
    }
  }
}
