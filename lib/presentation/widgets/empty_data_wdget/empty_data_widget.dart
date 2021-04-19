import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_cinema/common/constants/icon_constants.dart';
import 'package:flutter_cinema/common/constants/string_constants.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';

class EmptyDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(IconConstants.emptyDataIcon),
          SizedBox(height: 15.h),
          Text(StringConstants.emptyData),
        ],
      ),
    );
  }
}
