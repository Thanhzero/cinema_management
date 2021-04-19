import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/constants/layout_constants.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:shimmer/shimmer.dart';

class ProductCategorySkeletonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: LayoutConstants.paddingHorizontal / 2, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.w),
          topRight: Radius.circular(30.w),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        child: _buildShimmerItem(context),
      ),
    );
  }

  Widget _buildShimmerItem(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColor.shimmerBase,
      highlightColor: AppColor.shimmerHighlight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                width: 120.w,
                height: 40.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  shape: BoxShape.rectangle,
                  color: AppColor.white,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                width: 120.w,
                height: 40.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  shape: BoxShape.rectangle,
                  color: AppColor.white,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                width: 120.w,
                height: 40.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  shape: BoxShape.rectangle,
                  color: AppColor.white,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                width: 120.w,
                height: 40.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  shape: BoxShape.rectangle,
                  color: AppColor.white,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                width: 120.w,
                height: 40.h,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  shape: BoxShape.rectangle,
                  color: AppColor.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
