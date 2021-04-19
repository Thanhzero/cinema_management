import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/constants/layout_constants.dart';
import 'package:flutter_cinema/common/utils/screen_utils.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';

class StadiumSkeletonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        left: LayoutConstants.paddingHorizontal,
        right: LayoutConstants.paddingHorizontal,
        bottom: 10,
        top: 10,
      ),
      itemBuilder: (context, index) {
        return _buildShimmerItem(context);
      },
      itemCount: 5,
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: LayoutConstants.paddingHorizontal),
          child: Container(
            height: 1.h,
            color: AppColor.border,
          ),
        );
      },
    );
  }

  Widget _buildShimmerItem(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20.h),
      width: ScreenUtil.screenWidthDp,
      child: Shimmer.fromColors(
        baseColor: AppColor.shimmerBase,
        highlightColor: AppColor.shimmerHighlight,
        child: Row(
          children: [
            Container(
              height: ScreenUtil.screenWidthDp / 3,
              width: ScreenUtil.screenWidthDp / 3,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: AppColor.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 0,
                bottom: 0,
                top: 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: ScreenUtil.screenWidthDp / 2,
                    height: 20,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        shape: BoxShape.rectangle,
                        color: AppColor.white),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: ScreenUtil.screenWidthDp / 2,
                    height: 20,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        shape: BoxShape.rectangle,
                        color: AppColor.white),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: ScreenUtil.screenWidthDp / 2.5,
                    height: 20,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        shape: BoxShape.rectangle,
                        color: AppColor.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
