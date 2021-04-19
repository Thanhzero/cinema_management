import 'package:flutter/material.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:flutter_cinema/presentation/theme/theme_text.dart';

class ThemeDialog {
  // default Dialog style following guideline
  static double elevation = 0.0;
  static ShapeBorder shapeBorder = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(13.0),
      side: const BorderSide(color: AppColor.white));
  static TextStyle titleTextStyle = ThemeText.subhead
      .copyWith(fontWeight: FontWeight.bold, color: Colors.black);
  static TextStyle contentTextStyle =
      ThemeText.caption.copyWith(color: Colors.black);

  static DialogTheme getDefaultDialogTheme() => DialogTheme(
        elevation: ThemeDialog.elevation,
        shape: ThemeDialog.shapeBorder,
        titleTextStyle: ThemeDialog.titleTextStyle,
        contentTextStyle: ThemeDialog.contentTextStyle,
      );
}
