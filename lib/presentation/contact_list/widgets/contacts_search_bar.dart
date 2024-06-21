import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:icons_plus/icons_plus.dart";

import "../bloc/contact_list_bloc.dart";

class ContactsSearchBar extends StatelessWidget implements PreferredSizeWidget {
  const ContactsSearchBar({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: SearchBar(
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 12),
          ),
          onChanged: (final String value) {
            BlocProvider.of<ContactListBloc>(context)
                .add(SearchContactListEvent(query: value));
          },
          leading: const Icon(Iconsax.search_normal_outline),
          elevation: const WidgetStatePropertyAll<double>(0),
          backgroundColor: WidgetStatePropertyAll<Color>(
            Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
