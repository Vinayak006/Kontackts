import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";
import "package:gap/gap.dart";
import "package:icons_plus/icons_plus.dart";

import "../../../domain/entities/contact_entity.dart";
import "../../../domain/entities/phone_entity.dart";
import "../bloc/contact_list_bloc.dart";
import "contact_avatar.dart";
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

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    required this.contact,
    super.key,
  });

  final ContactEntity contact;

  @override
  Widget build(final BuildContext context) => SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    ContactAvatar(
                      size: 50,
                      avatar: contact.thumbnail,
                    ),
                    Text(
                      contact.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              const Gap(6),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: contact.phone
                      .map(
                        (final PhoneEntity phone) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Iconsax.call_outline),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(phone.label),
                              Text(
                                phone.number,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );
}
