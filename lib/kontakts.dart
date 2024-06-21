import "package:flutter/material.dart";

import "config/go_routes.dart";

class Kontacts extends StatelessWidget {
  const Kontacts({super.key});

  @override
  Widget build(final BuildContext context) => MaterialApp.router(
        theme: ThemeData(
          fontFamily: "Poppins",
          useMaterial3: true,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          fontFamily: "Poppins",
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: GoRoutes.goRouter,
      );
}
