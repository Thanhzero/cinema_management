import 'package:flutter_cinema/common/exceptions/server_exception.dart';

class BadRequestException extends ServerException {
  static List<ErrorList> _getErrorList(List<Map<String, dynamic>> errors) {
    if (errors != null) {
      return errors.map((error) => ErrorList.fromJson(error)).toList();
    }
    return [];
  }

  BadRequestException(Map<String, dynamic> error)
      : super(
          message: error['message'] ?? '',
          code: error['code'] ?? '',
          errors: _getErrorList(error['errors']),
        );
}
