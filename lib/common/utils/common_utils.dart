import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_cinema/common/configs/configurations.dart';
import 'package:flutter_cinema/common/constants/common_constants.dart';
import 'package:flutter_cinema/common/constants/image_constants.dart';
import 'package:flutter_cinema/common/constants/string_constants.dart';
import 'package:flutter_cinema/common/extensions/srceen_extensions.dart';
import 'package:flutter_cinema/common/utils/device_utils.dart';
import 'package:flutter_cinema/common/utils/permission_utils.dart';
import 'package:flutter_cinema/common/utils/screen_utils.dart';
import 'package:flutter_cinema/presentation/route/argument_constants.dart';
import 'package:flutter_cinema/presentation/route/route_constants.dart';
import 'package:flutter_cinema/presentation/theme/theme_color.dart';
import 'package:flutter_cinema/presentation/widgets/custom_bottomsheet.dart';
import 'package:flutter_cinema/presentation/widgets/custom_search_bottomsheet.dart';
import 'package:flutter_cinema/presentation/widgets/dialog_widget/confirm_dialog_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uni_links/uni_links.dart';

class CommonUtils {

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  static String convertFullNameToAvatarText(String name) {
    final convertName = name
            .trim()
            ?.split(' ')
            ?.map((e) => e.isNotEmpty ? e.substring(0, 1) : '')
            ?.toList() ??
        [];
    if (convertName.length > 2) {
      return '${convertName.first}${convertName.last}'.toUpperCase();
    } else {
      return '${convertName.join('')}'.toUpperCase();
    }
  }


  static void dismissKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  // static void openImagePicker(BuildContext context,
  //     {Function(File) onSelectImage,
  //     bool cropImage = true,
  //     double aspectRatio}) {
  //   dismissKeyBoard(context);
  //   final selectionList = SelectImageType.values.map((e) => e.label).toList();
  //   showModalBottomSheet(
  //       context: context,
  //       backgroundColor: AppColor.transparent,
  //       builder: (context) {
  //         return Wrap(
  //           children: <Widget>[
  //             CustomBottomSheet(
  //                 items: selectionList,
  //                 onTap: (label, index) async {
  //                   File imageFile;
  //                   switch (SelectImageType.values[index]) {
  //                     case SelectImageType.photo:
  //                       imageFile = await getImageFromSources(
  //                           ImageSource.gallery, cropImage);
  //                       break;
  //                     case SelectImageType.camera:
  //                       imageFile = await getImageFromSources(
  //                           ImageSource.camera, cropImage);
  //                       break;
  //                   }
  //                   if (imageFile != null && onSelectImage != null) {
  //                     if (cropImage) {
  //                       await Navigator.pushNamed(
  //                         context,
  //                         RouteList.cropImage,
  //                         arguments: {
  //                           ArgumentConstants.file: imageFile,
  //                           ArgumentConstants.aspectRatio: aspectRatio,
  //                           ArgumentConstants.callback: (file) {
  //                             if (file is File) {
  //                               if (file != null && onSelectImage != null) {
  //                                 onSelectImage(file);
  //                               }
  //                             }
  //                             Navigator.pop(context);
  //                           }
  //                         },
  //                       );
  //                     } else {
  //                       onSelectImage(imageFile);
  //                       Navigator.pop(context);
  //                     }
  //                   }
  //                 }),
  //           ],
  //         );
  //       });
  // }

  static void showModalBottomDialog({
    @required BuildContext context,
    @required Widget child,
    double radius,
    Function onClosed,
  }) {
    dismissKeyBoard(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColor.transparent,
      builder: (BuildContext builder) => SizedBox(
        height: ScreenUtil.screenHeightDp -
            defaultAppBarHeight -
            ScreenUtil.statusBarHeight +
            14.h,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 8.h),
              width: 80.w,
              height: 6.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.w),
                    topRight: Radius.circular(30.w),
                  ),
                ),
                child: child,
              ),
            )
          ],
        ),
      ),
    ).whenComplete(() {
      onClosed?.call();
    });
  }

  static Future<File> getImageFromSources(
    ImageSource imageSourceType,
    bool cropImage,
  ) async {
    if ((imageSourceType == ImageSource.gallery) &&
        !(await PermissionUtils.isPermissionGranted(Permission.photos))) {
      return null;
    }
    if ((imageSourceType == ImageSource.camera) &&
        !(await PermissionUtils.isPermissionGranted(Permission.camera))) {
      return null;
    }
    final imageFile = await ImagePicker().getImage(source: imageSourceType);
    if (imageFile != null) {
      return File(imageFile.path);
    }
    return null;
  }

  static void showCustomBottomSheet(BuildContext context, List<String> data,
      {Function(int) onItemSelected}) {
    dismissKeyBoard(context);
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColor.transparent,
        builder: (context) {
          return Wrap(
            children: <Widget>[
              CustomBottomSheet(
                  items: data,
                  onTap: (label, index) {
                    Navigator.pop(context);
                    onItemSelected?.call(index);
                  }),
            ],
          );
        });
  }

  static void showCustomSearchBottomSheet(BuildContext context, List<String> data,
      {Function(int) onItemSelected}) {
    dismissKeyBoard(context);
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColor.transparent,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: <Widget>[
              CustomSearchBottomSheet(
                  items: data,
                  onTap: (label, index) {
                    Navigator.pop(context);
                    onItemSelected?.call(index);
                  }),
            ],
          );
        });
  }

  static void showCustomWidgetBottomSheet(BuildContext context, Widget widget) {
    dismissKeyBoard(context);
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColor.transparent,
        builder: (context) {
          return Wrap(
            children: <Widget>[widget],
          );
        });
  }

  static void showConfirmDialog({
    @required BuildContext context,
    String title,
    @required String descriptions,
    bool barrierDismissible = true,
    Function onConfirm,
    Function onCancel,
  }) {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return barrierDismissible;
            },
            child: ConfirmDialogWidget(
              title: title ?? StringConstants.messageTitle,
              descriptions: descriptions,
              onConfirm: onConfirm,
              onCancel: onCancel,
            ),
          );
        });
  }
}
