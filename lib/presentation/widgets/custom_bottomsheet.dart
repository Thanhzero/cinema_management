import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/constants/layout_constants.dart';
import 'package:flutter_cinema/common/constants/string_constants.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';
import 'package:flutter_cinema/common/utils/screen_utils.dart';
import 'package:flutter_cinema/presentation/theme/theme_text.dart';
import 'package:flutter_cinema/presentation/widgets/vertical_line_widget.dart';

class BottomSheetItemEntity {
  String id;
  String name;

  BottomSheetItemEntity({
    @required this.id,
    @required this.name,
  });
}

class CustomBottomSheet extends StatelessWidget {
  final List<String> items;
  final Function(String, int) onTap;
  final int id;

  CustomBottomSheet({Key key, this.items, this.onTap, this.id})
      : super(key: key);

  num _calculatorHeightView() {
    final maxItem = items.length > 5 ? 5 : items.length;
    return maxItem * 70.h;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.5.w),
      child: Column(
        children: <Widget>[
          Container(
            height: _calculatorHeightView(),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => onTap(
                    items[index],
                    index,
                  ),
                  child: SizedBox(
                    height: 70.h,
                    child: Column(
                      children: <Widget>[
                        const Spacer(),
                        id != index
                            ? Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        LayoutConstants.paddingHorizontal),
                                child: Center(
                                  child: Text(
                                    items[index],
                                    style: ThemeText.body1
                                        .copyWith(fontSize: 22.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
                            : Row(
                                children: [
                                  SizedBox(
                                    width: 80.w,
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        items[index],
                                        style: ThemeText.body1
                                            .copyWith(fontSize: 22.sp),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80.w,
                                    child: Icon(
                                      Icons.check,
                                      size: 35.w,
                                      color: Colors.green,
                                    ),
                                  )
                                ],
                              ),
                        const Spacer(),
                        const VerticalLine(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: EdgeInsets.only(top: 5.h),
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Center(
                child: Text(
                  StringConstants.cancel,
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: ScreenUtil.bottomBarHeight + 10),
        ],
      ),
    );
  }
}
