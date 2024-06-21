import "package:permission_handler/permission_handler.dart";

class PermissionService {
  Future<bool> requestContactPermission() async {
    final bool hasPermission = await Permission.contacts.isGranted;
    if (hasPermission) {
      return true;
    }
    final PermissionStatus permissionStatus =
        await Permission.contacts.request();
    return permissionStatus.isGranted;
  }
}
