import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter_device_locale/flutter_device_locale.dart';
import 'package:flutter_cinema/common/constants/language_constants.dart';

class Device {
  static double devicePixelRatio = ui.window.devicePixelRatio;
  static ui.Size size = ui.window.physicalSize;
  static double width = size.width;
  static double height = size.height;
  static double screenWidth = width / devicePixelRatio;
  static double screenHeight = height / devicePixelRatio;
  static ui.Size screenSize = ui.Size(screenWidth, screenHeight);

  final bool isIos, isAndroid, isIphoneX;
  final double paddingVerticalInsets;
  static Device _device;

  Device({
    this.isIos,
    this.isAndroid,
    this.isIphoneX,
    this.paddingVerticalInsets,
  });

  factory Device.get() {
    if (_device != null) {
      return _device;
    }

    final bool isIos = Platform.isIOS;
    final bool isAndroid = Platform.isAndroid;
    bool isIphoneX = false;
    double paddingVerticalInsets = 0.0;

    if (isIos &&
        (screenHeight == 812 ||
            screenWidth == 812 ||
            screenHeight == 896 ||
            screenWidth == 896)) {
      isIphoneX = true;
      paddingVerticalInsets = 50.0;
    }

    return _device = Device(
      isAndroid: isAndroid,
      isIos: isIos,
      isIphoneX: isIphoneX,
      paddingVerticalInsets: paddingVerticalInsets,
    );
  }
}

Future<ui.Locale> getDeviceLocale() async {
  ui.Locale deviceLocale;
  try {
    deviceLocale = await DeviceLocale.getCurrentLocale();
  } catch (_) {}

  if (deviceLocale != null &&
      deviceLocale.languageCode == LanguageConstants.en) {
    return deviceLocale;
  }

  return const ui.Locale(LanguageConstants.en);
}
