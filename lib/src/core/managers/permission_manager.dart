import 'package:zexonline/src/locale/locale_key.dart';
import 'package:zexonline/src/ui/widgets/base/app_dialog.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

enum PermissionType { Contact, Camera }

class PermissionManager {
  Future<bool> checkPermission(Permission permission, PermissionType type,
      {bool showDialog = true}) async {
    bool isPermission = true;
    var status = await permission.status;
    if (status.isDenied) {
      status = await permission.request();
    } else if (status.isPermanentlyDenied) {
      isPermission = false;
      if (showDialog) {
        await showConfirmDialog(
          LocaleKey.settingContent.trParams({
            'name': type.name,
          }),
          textConfirm: LocaleKey.goToSettings.tr,
          onConfirmPressed: () async {
            await openAppSettings();
          },
        );
      }
    }

    if (status.isDenied) isPermission = false;

    return isPermission;
  }
}
