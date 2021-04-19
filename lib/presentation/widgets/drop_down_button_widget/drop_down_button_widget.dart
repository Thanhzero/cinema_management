import 'package:flutter/material.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:flutter_cinema/presentation/theme/theme_text.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';

class DropDownButtonWidget extends StatelessWidget {
  final List<String> items;
  final Function(String) onChanged;
  final String initValue;

  const DropDownButtonWidget(
      {Key key, this.items, this.onChanged, this.initValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0.h,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 0.5,
              color: AppColor.gray58,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: 0.5,
              color: AppColor.primaryColor,
            ),
          ),
        ),
        elevation: 0,
          value: initValue,
          style: TextTheme().input,
          items: items
              .map<DropdownMenuItem<String>>((String value) => DropdownMenuItem(
                    child: Container(
                      width: MediaQuery.of(context).size.width *0.35,
                      child: Text(
                        value,
                        style: TextTheme().input.copyWith(fontSize: 16.sp),
                      ),
                    ),
                    value: value,
                  ))
              .toList(),
          onChanged: (value) => onChanged(value)),
    );
  }
}
