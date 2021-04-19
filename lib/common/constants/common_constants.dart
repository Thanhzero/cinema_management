import 'package:flutter_cinema/common/constants/string_constants.dart';

enum SelectImageType { photo, camera }

extension SelectImageTypeExtension on SelectImageType {
  String get label {
    switch (this) {
      case SelectImageType.photo:
        return StringConstants.photo;
      case SelectImageType.camera:
        return StringConstants.camera;
      default:
        return '';
    }
  }
}
