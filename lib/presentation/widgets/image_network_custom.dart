import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_cinema/common/constants/icon_constants.dart';
import 'package:flutter_cinema/presentation/widgets/custom_avatar.dart';
import 'package:flutter_cinema/presentation/widgets/custom_circle_progress.dart';

class ImageNetworkCustom extends StatelessWidget {
  final String url;
  final String path;
  final double width;
  final double height;
  final Widget imageHolder;
  final BoxFit boxFit;
  final String baseURL;

  const ImageNetworkCustom({
    Key key,
    this.url,
    this.path,
    this.width = 40,
    this.height = 40,
    this.imageHolder,
    this.boxFit,
    this.baseURL
  }) : super(key: key);

  static String getUrlPictureByEndpoint(String baseURL, String endPoint) {
    return '$baseURL$endPoint';
  }

  @override
  Widget build(BuildContext context) {
    if ((url ?? path ?? '').isEmpty) {
      return Container(
        child: Center(
          child: imageHolder ??
              SvgPicture.asset(
                IconConstants.emptyDataIcon,
                width: width,
                height: height,
              ),
        ),
      );
    }
    if (Uri.parse(url ?? getUrlPictureByEndpoint(baseURL, path)).isAbsolute) {
      return Image.network(
        url ?? getUrlPictureByEndpoint(baseURL, path),
        fit: boxFit ?? BoxFit.cover,
        width: width,
        height: height,
        errorBuilder: (
          BuildContext context,
          Object error,
          StackTrace stackTrace,
        ) {
          return imageHolder ??
              Container(
                child: Center(
                  child: SvgPicture.asset(
                    IconConstants.emptyDataIcon,
                    width: width,
                    height: height,
                  ),
                ),
              );
        },
        loadingBuilder: (
          BuildContext context,
          Widget child,
          ImageChunkEvent loadingProgress,
        ) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(child: CustomCircleProgress());
        },
      );
    }
    if (isNumeric(url)) {
      return CustomAvatar(
        jerseyNumber: int.parse(url),
        sizeAvatar: width,
      );
    }
    return CustomAvatar(
      fullName: url,
      sizeAvatar: width,
    );
  }

  bool isNumeric(String s) {
    if (s == null || s.isEmpty) {
      return false;
    }
    return int.tryParse(s) != null;
  }
}
