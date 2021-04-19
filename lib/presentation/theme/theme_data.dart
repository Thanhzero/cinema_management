import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/utils/screen_utils.dart';
import 'theme_color.dart';

// These are sample values can be changed to have a more generic data.
// We are going to extend the theme for the relevant pages

ThemeData appTheme(BuildContext context) {
  ScreenUtil.init(context);
  return ThemeData(
    fontFamily: 'Muli',
    primaryColor: AppColor.primaryColor,
    // textTheme: ThemeText.getDefaultTextTheme(),
    // buttonTheme: ButtonThemeData(
    //   //update and enhance in screens where necessary
    //   buttonColor: AppColor.primaryColor,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(5.0),
    //   ),
    // ),
    // scaffoldBackgroundColor: AppColor.white,
    // iconTheme: ThemeIcon.getDefaultIconTheme(),
    // appBarTheme: const AppBarTheme(color: AppColor.white, elevation: 0.0),
    // dialogTheme: ThemeDialog.getDefaultDialogTheme(),
    // snackBarTheme: ThemeSnackBar.getDefaultSnackBarTheme(),
    // inputDecorationTheme: ThemeInputDecoration.get(context),
    toggleableActiveColor: AppColor.primaryColor,
    splashColor: AppColor.transparent,
    highlightColor: AppColor.transparent,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      splashColor: AppColor.transparent,
      hoverColor: AppColor.transparent,
      focusColor: AppColor.transparent,
      elevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      focusElevation: 0,
      backgroundColor: AppColor.primaryColor,
    ),
  );
}
