import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_cinema/common/utils/device_dimension_utils.dart';
import 'package:flutter_cinema/presentation/bloc/snackbar_bloc/snackbar_type.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:flutter_cinema/presentation/widgets/button_widget/button_widget.dart';
import 'package:flutter_cinema/presentation/widgets/modal_widget/modal.dart';
import 'package:flutter_cinema/presentation/widgets/snackbar_widget/snackbar_widget.dart';

const timeoutLimitSeconds = 10;

void showSnackBar(BuildContext context, String message, bool success,
    {Key key}) {
  WidgetsBinding.instance.addPostFrameCallback((_) => TopSnackBar(
        key: key,
        title: message,
        type: success ? SnackBarType.success : SnackBarType.error,
      ).show(context));
}

void dismissKeyboard(BuildContext context) {
  final FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

void onUnfocus(BuildContext context) {
  FocusScope.of(context).unfocus();
}

SvgPicture getSvgPicture({
  @required String assetName,
  @required double pictureWidth,
  @required double pictureHeight,
  ValueKey key,
}) {
  final isAssetNameEmpty = assetName?.isEmpty ?? true;
  return isAssetNameEmpty
      ? null
      : SvgPicture.asset(
          assetName,
          width: pictureWidth,
          height: pictureHeight,
          key: key,
        );
}

Future<bool> confirmExitPopup({
  BuildContext context,
  String title,
  String description,
  String confirmText,
  VoidCallback onConfirm,
}) async {
  return Modal<bool>(
    titleKey: const ValueKey('confirmationMessage'),
    descriptionKey: const ValueKey('confirmationDescription'),
    context: context,
    description: description,
    title: title,
    isFixedHorizontalActions: true,
    actions: <Widget>[
      Expanded(
        child: SizedBox(
          height: 40,
          child: ButtonWidget.primary(
            key: const ValueKey('confirmationCancelButton'),
            title: 'Cancel',
            activeStyle: _getTextStyleButtonCancel(context),
            onPress: () {
              Navigator.pop(context, false);
            },
          ),
        ),
      ),
      Expanded(
        child: SizedBox(
          height: 40,
          child: ButtonWidget.primary(
            key: const ValueKey('confirmationExitButton'),
            title: confirmText ?? 'Exit',
            activeStyle: _getTextStyleButtonClose(context),
            color: Colors.white,
            onPress: () {
              Navigator.pop(context, true);
              onConfirm?.call();
            },
          ),
        ),
      ),
    ],
  ).showModal();
}

Future<bool> confirmPopup({
  BuildContext context,
  String title,
  String description,
  String confirmText,
  VoidCallback onConfirm,
}) async {
  bool confirmValue = false;
  final makeOnClose = (value) => () {
        confirmValue = value;
        Navigator.of(context).pop();
        if (value) {
          onConfirm?.call();
        }
      };
  await Modal(
    titleKey: const ValueKey('confirmationMessage'),
    descriptionKey: const ValueKey('confirmationDescription'),
    context: context,
    description: description,
    title: title,
    isFixedHorizontalActions: true,
    actions: <Widget>[
      Expanded(
        child: SizedBox(
          height: 40,
          child: ButtonWidget.primary(
            key: const ValueKey('confirmationCancelButton'),
            title: 'Cancel',
            activeStyle: _getTextStyleButtonCancel(context),
            onPress: makeOnClose(false),
          ),
        ),
      ),
      SizedBox(
        width: 8,
        child: Container(),
      ),
      Expanded(
        child: SizedBox(
          height: 40,
          child: ButtonWidget.primary(
              key: const ValueKey('confirmationExitButton'),
              title: confirmText ?? '',
              activeStyle: _getTextStyleButtonAction(context),
              color: AppColor.white,
              onPress: makeOnClose(true)),
        ),
      ),
    ],
  ).showModal();
  return confirmValue;
}

TextStyle _getTextStyleButtonCancel(BuildContext context) {
  if (DeviceDimension.getDeviceWidth(context) <= ScreenSize.iP5SizeWidth) {
    return Theme.of(context).textTheme.caption.copyWith(
          color: AppColor.black,
          fontWeight: FontWeight.w600,
        );
  }
  return Theme.of(context).textTheme.title.copyWith(
        fontWeight: FontWeight.w600,
      );
}

TextStyle _getTextStyleButtonClose(BuildContext context) {
  if (DeviceDimension.getDeviceWidth(context) <= ScreenSize.iP5SizeWidth) {
    return Theme.of(context).textTheme.caption.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColor.lightDestructive,
        );
  }
  return Theme.of(context).textTheme.title.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColor.lightDestructive,
      );
}

Container getEmptyContainer(ValueKey key) => Container(
      key: key,
    );

TextStyle _getTextStyleButtonAction(BuildContext context) {
  if (DeviceDimension.getDeviceWidth(context) <= ScreenSize.iP5SizeWidth) {
    return Theme.of(context).textTheme.caption.copyWith(
        fontWeight: FontWeight.w500, color: AppColor.lightDestructive);
  }
  return Theme.of(context)
      .textTheme
      .title
      .copyWith(fontWeight: FontWeight.w500, color: AppColor.lightDestructive);
}

Material wrapWithMaterialInkWellCard({
  @required BuildContext context,
  @required Widget child,
  Key cardKey,
  Color cardColor,
  Color highlightColor,
  BorderRadius borderRadius,
  GestureTapCallback onTap,
}) =>
    Material(
      key: cardKey,
      type: MaterialType.card,
      color: cardColor ?? AppColor.white,
      borderRadius: borderRadius,
      child: InkWell(
        highlightColor: highlightColor ?? Theme.of(context).highlightColor,
        borderRadius: borderRadius,
        onTap: onTap,
        child: child,
      ),
    );
