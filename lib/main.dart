import "package:flutter/material.dart";

import "dependency_injection.dart";
import "kontakts.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependency();
  runApp(const Kontacts());
}
