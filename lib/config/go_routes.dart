import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "../constants/routes.dart";
import "../presentation/splash/views/splash_screen.dart";

class GoRoutes {
  GoRoutes._();
  static final GoRouter goRouter = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.splash,
        builder: (final BuildContext _, final GoRouterState state) =>
            const SplashScreen(),
      ),
    ],
  );
}
