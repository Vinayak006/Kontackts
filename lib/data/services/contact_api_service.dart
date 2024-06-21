import "package:flutter_contacts/flutter_contacts.dart";

import "../../core/resources/data_state.dart";
import "../models/contact_model.dart";
import "../models/phone_model.dart";

class ContactApiService {
  Future<DataState<List<ContactModel>>> getContacts() async {
    final List<Contact> contacts = await FlutterContacts.getContacts(
      withPhoto: true,
      withAccounts: true,
      withThumbnail: true,
      withProperties: true,
    );
    return DataSuccess<List<ContactModel>>(
      data: contacts.map(_getContactModel).toList(),
    );
  }

  ContactModel _getContactModel(final Contact contact) => ContactModel(
        id: contact.id,
        name: contact.displayName,
        thumbnail: contact.thumbnail,
        avatar: contact.photo,
        phone: contact.phones.map(_getPhoneModel).toList(),
      );

  PhoneModel _getPhoneModel(final Phone phone) =>
      PhoneModel(number: phone.number, label: phone.label.name);
}
