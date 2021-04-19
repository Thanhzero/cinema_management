import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/constants/layout_constants.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:flutter_cinema/presentation/theme/theme_text.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';

const _defaultHeight = 55.0;

class ButtonWidget extends RaisedButton {
  final Function onPress;
  final String title;
  final TextStyle activeStyle;
  final TextStyle inactiveStyle;
  final double height;
  final double roundedValue;
  final bool isUpperCase;
  final Color disabledColor;

  ButtonWidget.primary({
    Key key,
    this.onPress,
    this.title,
    this.activeStyle,
    this.inactiveStyle,
    this.roundedValue,
    this.isUpperCase=true,
    this.height = _defaultHeight,
    Color color = AppColor.primaryColor,this.disabledColor
  }) : super(
          key: key,
          elevation: 0,
          onPressed: onPress,
          child: Container(
            height: height.h,
            child: Center(
              child: Text(
                  (isUpperCase)?title.toUpperCase():title,
                //key: const ValueKey('button_go_home'),
                style: onPress != null
                    ? activeStyle ??
                        ThemeText.getDefaultTextTheme()
                            .button
                            .copyWith(height: LayoutConstants.fontHeight)
                    : inactiveStyle ??
                        ThemeText.getDefaultTextTheme()
                            .button
                            .copyWith(height: LayoutConstants.fontHeight),

              ),
            ),
          ),
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(roundedValue??height / 2),
          ),
          disabledColor:disabledColor ?? AppColor.paleGrey,
        );

  ButtonWidget.underline({
    Key key,
    this.onPress,
    this.title,
    this.activeStyle,
    this.inactiveStyle,
    this.height,
    this.roundedValue,
    this.isUpperCase,
    Color color = AppColor.retakeButtonColor,
    TextAlign textAlign = TextAlign.center,this.disabledColor
  }) : super(
          key: key,
          elevation: 0,
          focusElevation: 0,
          onPressed: onPress,
          color: color,
          highlightElevation: 0,
          padding: const EdgeInsets.all(0),
          child: Container(
            key: const ValueKey('buttonwidget_container_key'),
            padding: const EdgeInsets.only(top: 5),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColor.primaryColor,
                  width: 1.5,
                ),
              ),
            ),
            child: Text(
              title,
              textAlign: textAlign,
              style: onPress != null
                  ? activeStyle ??
                      ThemeText.getDefaultTextTheme().button.copyWith(
                            fontWeight: FontWeight.w400,
                            height: .7,
                          )
                  : inactiveStyle ??
                      ThemeText.getDefaultTextTheme()
                          .button
                          .copyWith(
                            fontWeight: FontWeight.w400,
                            height: .7,
                          ),
            ),
          ),
          disabledColor: AppColor.paleGrey,
        );
}
