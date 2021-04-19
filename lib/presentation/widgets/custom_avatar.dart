import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_cinema/common/configs/configurations.dart';
import 'package:flutter_cinema/common/constants/icon_constants.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';
import 'package:flutter_cinema/common/utils/common_utils.dart';
import 'package:flutter_cinema/common/utils/validate_utils.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:flutter_cinema/presentation/theme/theme_text.dart';

class CustomAvatar extends StatefulWidget {
  final String fullName;
  final String avatar;
  final File file;
  final String asset;
  final Function onTap;
  final double sizeAvatar;
  final int jerseyNumber;
  final Color backgroundColor;
  final Color borderColor;
  final double padding;
  final bool showCameraIcon;
  final bool isCircleAvatar;

  CustomAvatar({
    Key key,
    this.fullName='',
    this.avatar,
    this.file,
    this.asset,
    this.onTap,
    this.sizeAvatar,
    this.jerseyNumber,
    this.backgroundColor,
    this.borderColor,
    this.padding,
    this.showCameraIcon = false, this.isCircleAvatar=true,
  }) : super(key: key);

  @override
  _CustomAvatarState createState() => _CustomAvatarState();
}

class _CustomAvatarState extends State<CustomAvatar> {
  final String hostString = Configurations.baseImageUrl;

  String _getAvatarText() {
    if (widget.jerseyNumber == null) {
      return CommonUtils.convertFullNameToAvatarText(widget.fullName);
    }
    return '${widget.jerseyNumber}';
  }

  String _getImageUrl() {
    if (Validate.validateUrl(widget.avatar)) {
      return widget.avatar;
    }
    return '$hostString${widget.avatar}';
  }

  @override
  Widget build(BuildContext context) {
    final newSizeAvatar = widget.sizeAvatar ?? 160.w;
    return InkWell(
      onTap: widget.onTap,
      child: Stack(children: [
        Container(
          height: newSizeAvatar,
          width: newSizeAvatar,
          decoration: BoxDecoration(
            border: Border.all(
              width: widget.padding ?? 0,
              color:
                  widget.borderColor ?? widget.backgroundColor ?? Colors.white,
            ),
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
          borderRadius: (widget.isCircleAvatar)? BorderRadius.circular(80.w):BorderRadius.zero,
            child: _buildAvatarWidget(newSizeAvatar),
          ),
        ),
        widget.showCameraIcon
            ? Positioned(
                bottom: 5,
                right: 5,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: SvgPicture.asset(IconConstants.cameraIcon),
                ),
              )
            : const SizedBox()
      ]),
    );
  }

  Widget _buildAvatarWidget(num newSizeAvatar) {
    if (widget.file != null) {
      return Image.file(
        widget.file,
        fit: BoxFit.cover,
      );
    }
    if (widget.avatar != null && widget.avatar.isNotEmpty) {
      return Image.network(
        _getImageUrl(),
        fit: BoxFit.cover,
      );
    }
    if (widget.asset != null && widget.asset.isNotEmpty) {
      return Image.asset(
        widget.asset,
        fit: BoxFit.cover,
      );
    }
    return Container(
      color: AppColor.primaryColor,
      height: newSizeAvatar,
      width: newSizeAvatar,
      child: Center(
        child: Text(
          _getAvatarText(),
          style: ThemeText.body1.copyWith(
            color: AppColor.white,
            fontSize: (newSizeAvatar / 2).sp,
          ),
        ),
      ),
    );
  }
}
