import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  /// private constructor
  PermissionHelper._();

  /// the one and only instance of this singleton
  static final instance = PermissionHelper._();

  static Future<void> checkLocationPermission() async {
    final permissionGranted = await Permission.location.isGranted;
    if (!permissionGranted) {
      final result = await Permission.location.request();
      if (result.isPermanentlyDenied) {
        await openAppSettings();
      }
    }
  }
}
