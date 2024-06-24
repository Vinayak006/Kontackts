import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";
import "package:nb_utils/nb_utils.dart";

import "../../../domain/entities/contact_entity.dart";
import "../bloc/contact_list_bloc.dart";
import "contact_avatar.dart";
import "contact_info.dart";
import "highlighted_text.dart";

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<ContactListBloc, ContactListState>(
        builder: (final BuildContext context, final ContactListState state) =>
            switch (state) {
          GettingContactList() => const Center(
              child: CircularProgressIndicator(),
            ),
          ContatListLoaded() => AnimationLimiter(
              child: ListView.builder(
                itemBuilder: (final BuildContext context, final int index) {
                  final ContactEntity contact = state.contacts.elementAt(index);
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      verticalOffset: 50,
                      child: FadeInAnimation(
                        child: ListTile(
                          onTap: () async {
                            hideKeyboard(context);
                            await showModalBottomSheet(
                              context: context,
                              builder: (final BuildContext context) =>
                                  ContactInfo(contact: contact),
                            );
                          },
                          contentPadding: EdgeInsets.zero,
                          title: Text(contact.name),
                          leading: ContactAvatar(avatar: contact.thumbnail),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: state.contacts.length,
              ),
            ),
          ContactLitsSearchResult() => ListView.builder(
              itemBuilder: (final BuildContext context, final int index) {
                final ContactEntity contact = state.contacts.elementAt(index);
                return ListTile(
                  onTap: () async {
                    hideKeyboard(context);
                    await showModalBottomSheet(
                      context: context,
                      builder: (final BuildContext context) =>
                          ContactInfo(contact: contact),
                    );
                  },
                  contentPadding: EdgeInsets.zero,
                  title: HighlightedText(
                    text: contact.name,
                    highlightText: state.query,
                  ),
                  leading: ContactAvatar(avatar: contact.thumbnail),
                );
              },
              itemCount: state.contacts.length,
            ),
          ContactListFailed() => Center(
              child: Text(state.error),
            ),
          ContactListInitial() => const SizedBox.shrink(),
        },
      );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      BlocProvider.of<ContactListBloc>(context).add(GetContactListEvent());
    });
  }
}
