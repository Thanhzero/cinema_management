import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/constants/string_constants.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';
import 'package:flutter_cinema/common/utils/screen_utils.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:flutter_cinema/presentation/theme/theme_text.dart';
import 'package:shimmer/shimmer.dart';

class ScheduleSkeletonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidthDp,
      color: AppColor.transparent,
      child: Shimmer.fromColors(
        baseColor: AppColor.shimmerBase,
        highlightColor: AppColor.shimmerHighlight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                StringConstants.searchingMatch,
                style: ThemeText.display4.copyWith(
                    color: AppColor.white, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w),
              width: ScreenUtil.screenWidthDp / 1.7,
              height: 61.0.w,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                shape: BoxShape.rectangle,
                color: AppColor.white,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: ScreenUtil.screenWidthDp / 1.7,
                margin: EdgeInsets.only(right: 20.w),
                height: 61.0.w,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  shape: BoxShape.rectangle,
                  color: AppColor.white,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
