import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {
  static Future<bool> isPermissionGranted(Permission permission) async {
    final status = await permission.request();
    return status.isGranted;
  }
}
