import "package:flutter/material.dart";

import "../../../constants/strings.dart";
import "contacts_search_bar.dart";

class ContactListAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ContactListAppbar({super.key});

  @override
  Widget build(final BuildContext context) => AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.surface,
        title: const Text(Strings.appName),
        bottom: const ContactsSearchBar(),
      );

  @override
  Size get preferredSize => const Size.fromHeight(116);
}
