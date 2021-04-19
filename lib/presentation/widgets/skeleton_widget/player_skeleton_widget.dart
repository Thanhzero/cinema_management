import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/constants/layout_constants.dart';
import 'package:flutter_cinema/common/utils/screen_utils.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';

class PlayerSkeletonWidget extends StatelessWidget {
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
      itemCount: 10,
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
          child: Container(
            height: 1,
            color: AppColor.shimmerLine,
          ),
        );
      },
    );
  }

  Widget _buildShimmerItem(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidthDp,
      color: AppColor.white,
      child: Shimmer.fromColors(
        baseColor: AppColor.shimmerBase,
        highlightColor: AppColor.shimmerHighlight,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 0,
                bottom: 0,
                top: 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: 20,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        shape: BoxShape.rectangle,
                        color: AppColor.white),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
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
