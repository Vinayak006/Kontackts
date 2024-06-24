import "package:flutter/material.dart";
import "package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart";
import "package:gap/gap.dart";
import "package:go_router/go_router.dart";
import "package:icons_plus/icons_plus.dart";

import "../../../domain/entities/contact_entity.dart";
import "../../../domain/entities/phone_entity.dart";
import "contact_avatar.dart";

class ContactInfo extends StatelessWidget {
  const ContactInfo({
    required this.contact,
    super.key,
  });

  final ContactEntity contact;

  @override
  Widget build(final BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: context.pop,
            icon: const Icon(Iconsax.arrow_left_2_outline),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Iconsax.edit_2_outline,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Iconsax.trash_outline,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  ContactAvatar(
                    size: MediaQuery.sizeOf(context).width * 0.15,
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
                          onPressed: () async {
                            await FlutterPhoneDirectCaller.callNumber(
                              phone.number,
                            );
                          },
                          icon: Icon(
                            Iconsax.call_outline,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
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
      );
}
