import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_cinema/common/constants/icon_constants.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:flutter_cinema/presentation/theme/theme_text.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';

class ItemOption extends StatelessWidget {
  final String iconSource;
  final String label;
  final bool isSelected;
  final Widget optionSelected;
  final Function onTap;
  final EdgeInsetsGeometry contentPadding;
  final TextStyle labelTextStyle;
  final bool showTopBorder;

  const ItemOption({
    Key key,
    this.iconSource,
    this.label,
    this.isSelected = false,
    this.optionSelected,
    this.onTap,
    this.contentPadding,
    this.labelTextStyle,
    this.showTopBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = isSelected ? AppColor.primaryColor : AppColor.grey;

    final borderSide =
        BorderSide(width: 0.5, color: AppColor.gray58.withOpacity(0.6));
    return InkWell(
      onTap: () => {
        onTap?.call(),
      },
      child: Container(
        height: 59.5.h,
        decoration: BoxDecoration(
          border: Border(
              top: showTopBorder ? borderSide : BorderSide.none,
              bottom: borderSide),
        ),
        padding: contentPadding ?? EdgeInsets.symmetric(horizontal: 24.5.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Spacer(),
            Row(
              children: <Widget>[
                if (iconSource != null) ...[
                  SizedBox(
                    width: 22.w,
                    child: SvgPicture.asset(
                      iconSource,
                      width: 25.w,
                      height: 25.w,
                      color: _color,
                    ),
                  ),
                  SizedBox(width: 22.w)
                ],
                Expanded(
                  child: Text(
                    label,
                    style: labelTextStyle ??
                        ThemeText.body1.copyWith(
                            color: isSelected
                                ? AppColor.primaryColor
                                : Colors.black,
                            letterSpacing: 0.6.w,
                            fontSize: 23.sp,
                            fontWeight: FontWeight.w700),
                  ),
                ),
                optionSelected ?? Container(),
                Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 15.w, bottom: 15.w),
                  child: SvgPicture.asset(
                    IconConstants.nextIcon,
                    width: 9.w,
                    height: 15.w,
                    color: _color,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
