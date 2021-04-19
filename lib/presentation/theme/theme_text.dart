import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';

import 'theme_color.dart';

// All text style based on design guideline
class ThemeText {
  // Default Text Style Following Guideline
  static TextStyle display4 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Muli',
    color: Colors.black,
  );
  static TextStyle display3 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.normal,
    fontFamily: 'Muli',
    color: Colors.black,
  );
  static TextStyle display2 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    fontFamily: 'Muli',
    color: Colors.black,
  );
  static TextStyle display1 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.normal,
    fontFamily: 'Muli',
    color: Colors.black,
  );
  static TextStyle headline = TextStyle(
    fontSize: 35.sp,
    fontWeight: FontWeight.normal,
    fontFamily: 'Muli',
    color: Colors.black,
  );
  static TextStyle title = TextStyle(
    fontSize: 19.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Muli',
    color: Colors.black,
  );
  static TextStyle body1 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.normal,
    fontFamily: 'Muli',
    color: Colors.black,
  );
  static TextStyle body2 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Muli',
    color: Colors.black,
  );
  static TextStyle subhead = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Muli',
    color: Colors.black,
  );
  static TextStyle caption = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Muli',
    color: Colors.black,
  );
  static TextStyle overline = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.4,
    fontFamily: 'Muli',
    color: Colors.black,
  );
  static TextStyle button = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Muli',
    color: AppColor.white,
  );

  static TextStyle subButton = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Muli',
    color: AppColor.primaryColor,
  );

  static TextStyle textStyleProductName = TextStyle(
    fontSize: 25.sp,
    color: Colors.black,
    fontFamily: 'Muli',
  );

  static TextStyle textStyleProductCode = TextStyle(
    fontSize: 20.sp,
    color: AppColor.gray58,
    fontFamily: 'Muli',
  );

  static TextStyle textStyleProductPrice = TextStyle(
    fontSize: 30.sp,
    color: AppColor.red,
    fontFamily: 'Muli',
    fontWeight: FontWeight.w600,
  );

  static TextTheme getDefaultTextTheme() => TextTheme(
      display4: ThemeText.display4,
      display3: ThemeText.display3,
      display2: ThemeText.display2,
      display1: ThemeText.display1,
      headline: ThemeText.headline,
      title: ThemeText.title,
      body1: ThemeText.body1,
      body2: ThemeText.body2,
      subhead: ThemeText.subhead,
      caption: ThemeText.caption,
      overline: ThemeText.overline,
      button: ThemeText.button);
}

extension CustomTextTheme on TextTheme {
  TextStyle get splashTitle => TextStyle(
        color: AppColor.white,
        fontWeight: FontWeight.bold,
        fontSize: 25.sp,
        fontFamily: 'Muli',
      );

  TextStyle get extraBoldTitle => TextStyle(
        color: AppColor.black,
        fontWeight: FontWeight.w900,
        fontSize: 27.sp,
        fontFamily: 'Muli',
      );

  TextStyle get inputLabel => TextStyle(
        color: AppColor.black,
        fontWeight: FontWeight.w600,
        fontSize: 22.sp,
        fontFamily: 'Muli',
      );

  TextStyle get input => TextStyle(
        color: AppColor.black,
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
        fontFamily: 'Muli',
      );

  TextStyle get italicGreyText => TextStyle(
        fontStyle: FontStyle.italic,
        color: AppColor.grey,
        fontWeight: FontWeight.w400,
        fontSize: 18.sp,
        fontFamily: 'Muli',
      );
  TextStyle get normalText => TextStyle(
        color: AppColor.black,
        fontWeight: FontWeight.w400,
        fontSize: 20.sp,
        fontFamily: 'Muli',
      );
  TextStyle get boldText => TextStyle(
        color: AppColor.black,
        fontWeight: FontWeight.w600,
        fontSize: 26.sp,
        fontFamily: 'Muli',
      );

  TextStyle get textStyleInputError => TextStyle(
        fontSize: 17.sp,
        color: AppColor.red,
        fontFamily: 'Muli',
        fontWeight: FontWeight.w400,
        height: 0.7,
      );

  TextStyle get textStyleAppbar => TextStyle(
        fontSize: 25.5.sp,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontFamily: 'Muli',
        letterSpacing: 0.68.w,
      );
}
