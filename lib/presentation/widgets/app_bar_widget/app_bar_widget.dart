import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_cinema/common/constants/layout_constants.dart';
import 'package:flutter_cinema/common/utils/screen_utils.dart';
import 'package:flutter_cinema/presentation/theme/theme_text.dart';

class AppBarButton extends StatelessWidget {
  final Widget child;

  final String iconSource;
  final Color iconColor;
  final Function onTap;
  final double width;

  const AppBarButton({
    Key key,
    this.child,
    this.iconSource,
    this.onTap,
    this.width,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? LayoutConstants.defaultAppBarHeight,
      height: LayoutConstants.defaultAppBarHeight,
      child: InkWell(
        onTap: onTap,
        child: child ??
            Center(
              child: SvgPicture.asset(
                iconSource,
                color: iconColor ?? Colors.white,
                width: 20,
                height: 20,
              ),
            ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  final AppBarButton leading;
  final Widget action;
  final String title;
  final Widget centerWidget;

  AppBarWidget({
    Key key,
    this.leading,
    this.title,
    this.action,
    this.centerWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: LayoutConstants.defaultAppBarHeight,
      margin: EdgeInsets.only(top: ScreenUtil.statusBarHeight),
      child: Row(
        children: <Widget>[
          leading ??
              SizedBox(
                width: LayoutConstants.defaultAppBarHeight,
                height: LayoutConstants.defaultAppBarHeight,
              ),
          Expanded(
            child: centerWidget ??
                Text(
                  title ?? '',
                  style: TextTheme().textStyleAppbar,
                  textAlign: TextAlign.center,
                ),
          ),
          action ??
              SizedBox(
                width: LayoutConstants.defaultAppBarHeight,
                height: LayoutConstants.defaultAppBarHeight,
              ),
        ],
      ),
    );
  }
}
