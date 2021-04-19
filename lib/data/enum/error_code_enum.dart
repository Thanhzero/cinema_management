import 'package:flutter_cinema/common/constants/string_constants.dart';

class ErrorCodeEnum {
  static ErrorCode getErrorCode(String code) {
    if (code == null || code.isEmpty) {
      return null;
    }
    return ErrorCode.values.where((value) => value.code == code)?.first;
  }
}

enum ErrorCode {
  errorCode_001_001_001,
  errorCode_002_409,
  errorCode_000_403,
  errorCode_001_001_401,
  errorCode_003_001,
  errorCode_000_402,
  errorCode_000_404,
  errorCode_004_001,
  errorCode_005_001,
}

extension ErrorCodeExtension on ErrorCode {
  String get code {
    switch (this) {
      case ErrorCode.errorCode_001_001_001:
        return '001.001.001';
      case ErrorCode.errorCode_002_409:
        return '002.409';
      case ErrorCode.errorCode_000_403:
        return '000.403';
      case ErrorCode.errorCode_001_001_401:
        return '001.001.401';
      case ErrorCode.errorCode_003_001:
        return '003.001';
      case ErrorCode.errorCode_000_402:
        return '000.402';
      case ErrorCode.errorCode_000_404:
        return '000.404';
      case ErrorCode.errorCode_004_001:
        return '004.001';
      case ErrorCode.errorCode_005_001:
        return '005.001';
      default:
        return '';
    }
  }

  String get message {
    switch (this) {
      case ErrorCode.errorCode_001_001_001:
        return StringConstants.error001_001_001;
      case ErrorCode.errorCode_002_409:
        return StringConstants.error002_409;
      case ErrorCode.errorCode_000_403:
        return StringConstants.error000_403;
      case ErrorCode.errorCode_001_001_401:
        return StringConstants.error001_001_001;
      case ErrorCode.errorCode_003_001:
        return StringConstants.error003_001;
      case ErrorCode.errorCode_000_402:
        return StringConstants.error000_402;
      case ErrorCode.errorCode_000_404:
        return StringConstants.errorSomethingWentWrong;
      case ErrorCode.errorCode_004_001:
        return StringConstants.error004_001;
      case ErrorCode.errorCode_005_001:
        return StringConstants.error005_001;
      default:
        return StringConstants.errorSomethingWentWrong;
    }
  }

  bool get showErrorMessage {
    switch (this) {
      case ErrorCode.errorCode_001_001_001:
      case ErrorCode.errorCode_002_409:
      case ErrorCode.errorCode_000_403:
      case ErrorCode.errorCode_003_001:
      case ErrorCode.errorCode_004_001:
      case ErrorCode.errorCode_005_001:
        return true;

      case ErrorCode.errorCode_000_402:
      case ErrorCode.errorCode_000_404:
      case ErrorCode.errorCode_001_001_401:
        return false;

      default:
        return true;
    }
  }
}
