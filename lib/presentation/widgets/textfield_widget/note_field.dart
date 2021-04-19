import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/constants/string_constants.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';
import 'package:flutter_cinema/presentation/theme/theme_text.dart';
import 'package:flutter_cinema/presentation/widgets/textfield_widget/textfield_widget.dart';

class NoteField extends StatelessWidget {
  final String label;
  final Function onChange;
  final Function onTap;
  final TextEditingController controller;

  NoteField({Key key, this.label, this.onChange, this.controller, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 150.h,
          child: TextFieldWidget(
            onTap: onTap,
            label: label ?? StringConstants.note,
            onSaved: null,
            onChanged: onChange,
            maxLength: 200,
            minLines: 5,
            maxLines: 5,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            controller: controller,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.w),
            child: Text(
              '(${utf8.encode(controller.text).length}/200)',
              style: TextTheme().inputLabel.copyWith(
                    fontStyle: FontStyle.italic,
                    fontSize: 16.sp,
                  ),
            ),
          ),
        )
      ],
    );
  }
}
