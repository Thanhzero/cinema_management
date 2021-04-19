import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/configs/configurations.dart';
import 'package:flutter_cinema/presentation/route/route_constants.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  dynamic startTime() async {
    final _duration =
    Duration(seconds: Configurations.splashScreenSecondTimeOut);
    return Timer(_duration, navigationPage);
  }
  Future<void> navigationPage() async {
      Navigator.pushReplacementNamed(context, RouteList.login);
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
    );
  }
}