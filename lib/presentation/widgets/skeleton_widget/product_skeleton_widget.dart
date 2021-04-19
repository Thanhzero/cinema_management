import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/constants/layout_constants.dart';
import 'package:flutter_cinema/common/utils/screen_utils.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:shimmer/shimmer.dart';

class ProductSkeletonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(LayoutConstants.paddingHorizontal / 2),
          child: Shimmer.fromColors(
            baseColor: AppColor.shimmerBase,
            highlightColor: AppColor.shimmerHighlight,
            child: AspectRatio(
              aspectRatio: 1 / 0.25,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  shape: BoxShape.rectangle,
                  color: AppColor.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(
              left: 0,
              right: 0,
              bottom: 10,
              top: 10,
            ),
            childAspectRatio: 0.8,
            children: List.generate(
              10,
              (index) {
                return _buildShimmerItem(context);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerItem(BuildContext context) {
    final itemSize = (ScreenUtil.screenWidthNotPixel - 24 * 2 - 10) / 2;
    return Container(
      child: Shimmer.fromColors(
        baseColor: AppColor.shimmerBase,
        highlightColor: AppColor.shimmerHighlight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: itemSize,
              height: itemSize,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                shape: BoxShape.rectangle,
                color: AppColor.white,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: EdgeInsets.only(right: itemSize * 0.2),
              width: itemSize,
              height: 15,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  shape: BoxShape.rectangle,
                  color: AppColor.white,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: EdgeInsets.only(right: itemSize * 0.4),
              width: itemSize,
              height: 15,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(3)),
                  shape: BoxShape.rectangle,
                  color: AppColor.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
