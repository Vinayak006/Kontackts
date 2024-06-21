import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "../../../constants/routes.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      context.go(Routes.contactList);
    });
  }

  @override
  Widget build(final BuildContext context) => Material(
        child: Center(
          child: Text(
            "Hello!",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      );
}
