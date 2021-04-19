import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/constants/string_constants.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';
import 'package:flutter_cinema/common/utils/remove_unicode/tiengviet.dart';
import 'package:flutter_cinema/common/utils/screen_utils.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:flutter_cinema/presentation/theme/theme_text.dart';
import 'package:flutter_cinema/presentation/widgets/vertical_line_widget.dart';

class CustomSearchBottomSheet extends StatefulWidget {
  final List<String> items;
  final Function(String, int) onTap;

  const CustomSearchBottomSheet({Key key, this.items, this.onTap})
      : super(key: key);

  @override
  _CustomSearchBottomSheetState createState() =>
      _CustomSearchBottomSheetState();
}

class _CustomSearchBottomSheetState extends State<CustomSearchBottomSheet> {
  final _inputController = TextEditingController();

  num _calculatorHeightView() {
    final maxItem = widget.items.length > 5 ? 5 : widget.items.length;
    return maxItem * 70.h;
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  List<String> getData() {
    if (_inputController.text.isEmpty) {
      return widget.items;
    }
    return widget.items
        .where((e) => TiengViet.parse(e.toLowerCase().trim()).contains(
            TiengViet.parse(_inputController.text.toLowerCase().trim())))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final data = getData();

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.5.w),
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        children: <Widget>[
          Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: TextField(
              autocorrect: false,
              controller: _inputController,
              onChanged: (value) {
                setState(() {});
              },
              style: ThemeText.display2
                  .copyWith(fontSize: 20.w, color: AppColor.black),
              decoration: InputDecoration(
                prefixIcon:
                    Icon(Icons.search, color: AppColor.black, size: 30.w),
                contentPadding: EdgeInsets.symmetric(vertical: 5.w),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.transparent, width: 0),
                    borderRadius: BorderRadius.circular(0)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColor.transparent, width: 0),
                    borderRadius: BorderRadius.circular(0)),
                hintText: StringConstants.search,
                hintStyle: ThemeText.display1
                    .copyWith(fontSize: 20.w, color: AppColor.black),
              ),
            ),
          ),
          Container(
            height: _calculatorHeightView(),
            margin: EdgeInsets.only(top: 5.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => widget.onTap?.call(
                    data[index],
                    widget.items.indexOf(data[index]),
                  ),
                  child: SizedBox(
                    height: 70.h,
                    child: Column(
                      children: <Widget>[
                        const Spacer(),
                        Center(
                          child: Text(
                            data[index],
                            style: ThemeText.body1.copyWith(fontSize: 22.sp),
                          ),
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
