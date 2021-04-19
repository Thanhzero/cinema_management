import 'package:flutter/material.dart';
import 'package:flutter_cinema/common/constants/string_constants.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:flutter_cinema/presentation/theme/theme_text.dart';

class ConfirmDialogWidget extends StatelessWidget {
  final String title;
  final String descriptions;
  final Function onConfirm;
  final Function onCancel;

  const ConfirmDialogWidget({
    Key key,
    this.title,
    @required this.descriptions,
    this.onConfirm,
    this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 40),
      backgroundColor: Colors.transparent,
      child: _buildContentBox(context),
    );
  }

  Widget _buildContentBox(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              title,
              style: ThemeText.title.copyWith(fontSize: 20.sp),
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              descriptions,
              style: ThemeText.title.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30.h),
          Container(
            height: 1,
            color: Colors.grey[300],
          ),
          Container(
            height: 50,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      onCancel?.call();
                    },
                    child: Text(
                      StringConstants.cancel,
                      style: ThemeText.title.copyWith(
                        color: AppColor.red,
                        fontSize: 20.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: double.infinity,
                  color: Colors.grey[300],
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      onConfirm?.call();
                    },
                    child: Text(
                      StringConstants.ok,
                      style: ThemeText.title.copyWith(
                        color: AppColor.primaryColor,
                        fontSize: 20.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
