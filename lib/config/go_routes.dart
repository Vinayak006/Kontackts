import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "../constants/routes.dart";
import "../presentation/contact_list/contacts_list_view.dart";
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
      GoRoute(
        path: Routes.contactList,
        builder: (final BuildContext _, final GoRouterState state) =>
            const ContactsListView(),
      ),
    ],
  );
}
