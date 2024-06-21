import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:nb_utils/nb_utils.dart";

import "../../dependency_injection.dart";
import "../../domain/repositories/contact_repository.dart";
import "../../domain/usecases/get_contact_list.dart";
import "bloc/contact_list_bloc.dart";
import "widgets/contact_list.dart";
import "widgets/contact_list_appbar.dart";

class ContactsListView extends StatelessWidget {
  const ContactsListView({super.key});

  @override
  Widget build(final BuildContext context) => BlocProvider<ContactListBloc>(
        create: (final BuildContext context) => ContactListBloc(
          getContactListUseCase: GetContactListUseCase(
            repository: locator.get<ContactRepository>(),
          ),
        ),
        child: GestureDetector(
          onTap: () => hideKeyboard(context),
          child: const Scaffold(
            appBar: ContactListAppbar(),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: ContactList(),
            ),
          ),
        ),
      );
}
