import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/constants/image_constants.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';
import 'package:flutter_cinema/common/utils/screen_utils.dart';
import 'package:flutter_cinema/common/utils/validate_utils.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';

class FrameWidget extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final String backgroundAsset;
  final bool resizeToAvoidBottomInset;
  final bool resizeToAvoidBottomPadding;

  final Widget appBar;
  final bool noBorderRadius;
  final bool enableSafeArea;
  final Widget customAppBar;
  final bool hideBackground;
  final bool overFlowStatusBar;
  final bool overlay;

  FrameWidget({
    Key key,
    @required this.child,
    this.backgroundAsset,
    this.onTap,
    this.resizeToAvoidBottomInset = true,
    this.resizeToAvoidBottomPadding,
    @required this.appBar,
    this.noBorderRadius = false,
    this.enableSafeArea = false,
    this.hideBackground = false,
    this.overFlowStatusBar = false,
    this.customAppBar,
    this.overlay = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _radius = 30.w;
    return Scaffold(
      resizeToAvoidBottomPadding: resizeToAvoidBottomPadding,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: ScreenUtil.screenHeightDp * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: _buildBackgroundImage(),
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            child: overlay
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
                    child: Container(
                      decoration: BoxDecoration(color: AppColor.overlay),
                    ),
                  )
                : null,
          ),
          InkWell(
            onTap: onTap,
            child: Column(
              children: <Widget>[
                if (appBar != null) appBar,
                Expanded(
                  child: ClipRRect(
                    borderRadius: noBorderRadius
                        ? BorderRadius.zero
                        : BorderRadius.only(
                            topLeft: Radius.circular(_radius),
                            topRight: Radius.circular(_radius),
                          ),
                    child: Container(
                      color: Colors.white,
                      child: SafeArea(
                        top: false,
                        bottom: enableSafeArea,
                        child: child,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (customAppBar != null)
            SizedBox(
              child: customAppBar,
            ),
        ],
      ),
    );
  }

  ImageProvider _buildBackgroundImage() {
    if (backgroundAsset == null || backgroundAsset.isEmpty) {
      return ExactAssetImage(ImageConstants.background);
    }
    if (Validate.validateUrl(backgroundAsset)) {
      return NetworkImage(backgroundAsset);
    }
    return ExactAssetImage(ImageConstants.background);
  }
}
