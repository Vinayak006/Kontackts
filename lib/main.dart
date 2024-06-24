import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "core/services/permission_service.dart";
import "dependency_injection.dart";
import "kontakts.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool hasContactsPermission =
      await PermissionService().requestContactPermission();
  if (hasContactsPermission) {
    injectDependency();
    runApp(const Kontacts());
  } else {
    await SystemNavigator.pop();
  }
}
