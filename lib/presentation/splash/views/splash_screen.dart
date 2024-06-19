import "package:flutter/material.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final _) {});
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
