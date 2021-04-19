import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/constants/layout_constants.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';

class SkeletonNewTeamWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
        padding: EdgeInsets.only(
            left: LayoutConstants.standardPadding,
            right: LayoutConstants.standardPadding,
            top: 10.h,
            bottom: 10.h),
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return _buildShimmerItem();
      },
      itemCount: 6,
        separatorBuilder: (context, index) {
          return SizedBox(width: 15.w,);
        }
    );
  }

  Widget _buildShimmerItem() {
    return Container(
      width: 144.w,
      child: Shimmer.fromColors(
        baseColor: AppColor.shimmerBase,
        highlightColor: AppColor.shimmerHighlight,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.w),
              shape: BoxShape.rectangle,
              color: AppColor.white),
        ),
      ),
    );
  }
}
