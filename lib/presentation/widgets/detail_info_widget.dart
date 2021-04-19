import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:flutter_cinema/presentation/theme/theme_text.dart';

class DetailInfoWidget extends StatelessWidget {
  final String leadText;
  final String trailText;
  final Color trailTextColor;
  final Widget trailWidget;
  final bool canOverFlow;
  final Function onTap;

  const DetailInfoWidget({
    Key key,
    this.leadText,
    this.trailText,
    this.trailTextColor,
    this.trailWidget,
    this.canOverFlow = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Container(
            decoration: BoxDecoration(
                color: AppColor.white,
                border: Border(
                    bottom: BorderSide(color: AppColor.greyA04, width: 1.h))),
            padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
              leadText,
              style: TextTheme().normalText.copyWith(
                  fontSize: 20.sp,
                  color: AppColor.blackOpacity2,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 20.w,),
            canOverFlow ? Expanded(
          child: trailWidget ??
              Text(
                trailText,
                textAlign: TextAlign.end,
                style: TextTheme().normalText.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: trailTextColor == null
                      ? AppColor.black
                      : trailTextColor,
                ),
              ),
        ) : trailWidget ??
            Text(
              trailText,
              style: TextTheme().normalText.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
                color: trailTextColor == null
                    ? AppColor.black
                    : trailTextColor,
              ),
            ),
        ],
      ),
    ),)
    ,
    );
  }
}
