import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_cinema/common/constants/icon_constants.dart';
import 'package:flutter_cinema/presentation/widgets/logo_widget/logo_widget_constants.dart';

class Logo extends StatelessWidget {
  final double logoSize;

  const Logo({Key key, this.logoSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      IconConstants.logoWhite,
      width: logoSize ?? LogoWidgetConstants.logoWidthNormal,
    );
  }
}
