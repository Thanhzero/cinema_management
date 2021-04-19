import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Define all custom color which includes
// Color code, hexa color, color from opacity, color from alpha

class AppColor {
  // because withAlpha replaced with `a` (which ranges from 0 to 255).;
  static const Color primaryColor = Color(0xff2ecc71);
  static const Color white = Colors.white;
  static Color transparent = Colors.transparent;
  static const Color grey = Color(0xff828282);
  static const Color greyLight = Color(0xff999999);
  static const Color grey84 = Color(0xffd6d6d6);
  static const Color grayWhite = Color(0xfff5f5f5);
  static const Color silver = Color.fromRGBO(0, 0, 0, 0.4);
  static const Color paleGrey = Color(0xfff4f4f5);
  static const Color textFieldBackgroundColor = Color(0xfff5f5f5);
  static const Color black = Colors.black;
  static Color blackOpacity5 = Colors.black.withOpacity(0.5);
  static Color blackOpacity4 = Colors.black.withOpacity(0.4);
  static Color black80 = Colors.black.withAlpha(230);
  static Color black50 = Colors.black.withOpacity(0.5);
  static Color black40 = Colors.black.withAlpha(102);
  static Color black25 = Colors.black.withAlpha(64);
  static Color black5 = Colors.black.withAlpha(38);
  static Color black2 = Colors.black.withOpacity(0.2);
  static const Color backgroundAvatar = Color(0xffffad0d);
  static const Color disableButton = Color(0x3f000000);
  static const Color actionTextSnackBar = Colors.black;
  static const Color disabledActionTextSnackBar = Colors.grey;
  static const Color limaColor = Color(0xff6dd400);
  static const Color dotsDisable = Color(0xffd8d8d8);
  static const Color progressColor = Color(0xff121212);
  static const Color backgroundPinButtonLoginTheme = Color(0xff64b5f6);
  static const Color backgroundPinButton = Color(0xfff4f4f4);
  static const Color organ = Color(0xfffdaf27);
  static const Color organLight = Color(0x33fdaf27);
  static const Color orangeDark = Color(0xFFF46400);
  static const Color purple = Color(0xffa605ad);
  static const Color emojiCategoryName = Color(0xff707174);
  static const Color shortcutBackground = Colors.white;
  static const Color shortcutBorderColor = Color(0xffe6e6e6);
  static const Color shortcutShadowColor = Color(0x19000000);
  static const Color shortcutTitleColor = Color(0xff000000);
  static const Color shortcutSubTitleColor = Color(0x66000000);
  static const Color wrongText = Color(0xffe02020);
  static const Color borderOtpBoxColor = Color(0xffffffa7);
  static Color selectedBlue = Colors.blue[900];
  static Color shadowColor = Colors.black.withOpacity(0.1);
  static const Color unselectedGrey = Colors.grey;
  static const Color hintTextColor = Color(0x66000000);
  static const Color labelTextField = Color(0x7f000000);
  static const Color backgoundPots1 = Color(0xfff5f5f5);
  static const Color backgoundPots2 = Color(0xffefefef);
  static const Color headerPanel = Color(0xffc4c4c6);
  static const Color dividerColor = Color.fromRGBO(0, 0, 0, 0.1);
  static const Color textFormFieldErrorColor = Color(0xffe02020);
  static const Color textFormFieldLabelColor = Color(0x66000000);
  static const Color clickableTextColor = Color(0xff007aff);
  static const Color inActiveSilver = Color(0xff989898);
  static const Color activeGreen = Color(0xff6dd400);
  static const Color activeBlue = Color(0xFF32c5ff);
  static const Color greenIconColor = Color(0xff71d227);
  static const Color green = Color(0xFF00FF00);
  static const Color lightGreen = (Color(0xff2ecc71));
  static const Color turquoiseIconColor = Color(0xff4dd6b6);
  static const Color yellowIconColor = Color(0xfff5b42b);
  static const Color yellowIconBackground = Color(0xfffcd22a);
  static const Color redIconColor = Color(0xffd32429);
  static const Color indicatorBar = Color(0xffc4c4c6);
  static const Color invalidBoxColor = Color(0xffff0048);
  static const Color textHightlight = Color(0xff32c5ff);
  static const Color contentSelectionColor = Color(0xff000000);
  static const Color titleSelectionColor = Color(0x66000000);
  static Color blackOpacity25 = Colors.black.withOpacity(0.25);
  static const personalInfoButtonColor = Color(0xfff4f4f5);
  static const Color backgroundButtonCamera = Color(0xffd6d6d6);
  static const Color backgroundOverlay = Color.fromRGBO(00, 00, 00, 0.4);
  static Color backgroundScanDocument = Colors.white.withAlpha(40);
  static const Color npwpBackgroundColor = Color(0xfff6d57a);
  static const Color npwpColorButtonDisable = Color(0xFFe5e5e5);
  static const Color cardBorder = Color(0xffe6e6e6);

  static const Color boxShadow = Color.fromRGBO(10, 31, 68, 0.1);
  static const Color videoCallActivationScreenLowerBodyText = Color(0xFFF46400);

  static const Color headerGradient1 = Color.fromRGBO(253, 175, 39, 0);
  static const Color headerGradient2 = Color.fromRGBO(253, 175, 39, 0.75);
  static const Color headerGradient3 = Color(0xfffDAF27);
  static const Color aliasBackgroundGradient1 =
      Color.fromRGBO(253, 175, 39, 0.9);
  static const Color shortcutsBackgroundGradient1 =
      Color.fromRGBO(253, 175, 39, 0.2);
  static const Color aliasBackgroundGradient2 = Color(0xfffDAF27);
  static const Color retakeButtonColor = Color.fromRGBO(235, 235, 245, 0.3);
  static const Color shadowColorButton = Color(0x66afafaf);
  static const Color destructive = Color(0xffe02020);
  static Color contentScreenBackground = const Color(0xfff9f9f9);

  static const Color shadowCardContactColor = Color(0x190a1f44);

  static const Color mySin = Color(0xffFEB026);
  static const Color apricot = Color(0xffEB8761);
  static const Color cranberry = Color(0xffda6682);
  static const Color darkDestructive = Color(0xffe02020);
  static const Color lightDestructive = Color(0xffff0048);
  static const Color shadowStepColor = Color.fromRGBO(10, 31, 68, 0.1);
  static const Color backgroundCloseButton =
      Color.fromRGBO(118, 118, 128, 0.12);
  static const Color transactionIncoming = Color(0xff4caf50);
  static const Color shortcutsCheckedIcon = Color(0xfffdaf27);

  static const Color totalAmountMatch = Color(0xff4caf50);
  static const Color totalAmountNotMatch = Color(0xffff0048);
  static Color backgroundPasswordColor = Colors.white;
  static Color subTitleColor = Colors.black.withAlpha(85);
  static const Color devicePrimaryBackground = Color(0xfffff3df);
  static const Color success = Color(0xFF4ca456);

  static const Color miniCloseButton = Color(0xeeeeefff);
  static const Color progressBackground = Color(0xffefefef);
  static const Color savingModeShadowColor =
      Color.fromRGBO(130, 130, 130, 0.25);


  static Color greyA04 = Color(0xD8D8D8).withOpacity(0.8);
  static const Color gray58 = Color(0xff949494);
  static Color blackOpacity2 = Color(0xff000000).withOpacity(0.2);
  static Color blackOpacity05 = Color(0xff000000).withOpacity(0.05);
  static const red = Color(0xffFF2929);
  static const border = Color(0xFFE0E0E0);
  static const blue = Color(0xFF1478CF);
  static const orange = Color(0xFFFFA500);
  static const yellow = Color(0xffc1c15b);
  static const red500 = Color(0xffFF2929);
  static const pink500 = Color(0xffE91E63);
  static const purple400 = Color(0xffAB47BC);
  static const blue500 = Color(0xff2196F3);
  static const green500 = Color(0xff4CAF50);
  static const yellow600 = Color(0xffFDD835);
  static const orange700 = Color(0xffffa000);
  static const softGreen = Color(0xffF2FFF8);
  static Color primaryColorOpacity01 = Color(0xff2ecc71).withOpacity(0.1);
  static const greenA5 = Color(0xff52b2a5);
  static const blueBD = Color(0xff438fbd);
  static const grayFAFAFA = Color(0xffFAFAFA);
  static Color overlay = Color(0xFF000000).withOpacity(0.6);
  static const blueE8F3FE = Color(0xffE8F3FE);

  /// Shimmer color
  static Color shimmerLine = Color(0xFFE0E0E0);
  static Color shimmerBase = Color(0xFFE0E0E0);
  static Color shimmerHighlight = Color(0xFFF5F5F5);
}
