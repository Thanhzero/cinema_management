import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/constants/layout_constants.dart';
import 'package:flutter_cinema/common/constants/string_constants.dart';
import 'package:flutter_cinema/common/utils/screen_utils.dart';
import 'package:flutter_cinema/common/utils/validate_utils.dart';
import 'package:flutter_cinema/presentation/widgets/textfield_widget/textfield_widget.dart';

class DatePickerWidget extends StatefulWidget {
  final int datetimeDefault;
  final bool firstInit;
  final TextEditingController controller;
  final Function(DateTime) getDateTime;
  final String label;
  final Function(String) validate;

  DatePickerWidget(this.getDateTime, this.firstInit,
      {Key key, this.datetimeDefault, this.controller,this.label,this.validate})
      : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  Widget _datePicker(BuildContext context) {
    final now = DateTime.now();
    return Container(
      color: Colors.white,
      height: LayoutConstants.pickerHeight,
      padding: EdgeInsets.only(
        left: LayoutConstants.paddingHorizontal,
        right: LayoutConstants.paddingHorizontal,
        bottom: ScreenUtil.bottomBarHeight,
      ),
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime: widget.datetimeDefault != null
            ? DateTime.fromMillisecondsSinceEpoch(widget.datetimeDefault)
            : now,
        maximumDate: now,
        onDateTimeChanged: (dateTime) {
          widget.getDateTime?.call(dateTime);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (_) => _datePicker(context),
        );
      },
      child: TextFieldWidget(
        label:widget.label ?? StringConstants.dateOfBirth,
        controller: widget.controller,
        onSaved: null,
        readOnly: true,
        editable: false,
        validator:widget.validate ?? Validate.validateBirthDay,
        floatingLabelBehavior: widget.firstInit == false
            ? FloatingLabelBehavior.auto
            : FloatingLabelBehavior.always,
      ),
    );
  }
}
