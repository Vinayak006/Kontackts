part of "contact_list_bloc.dart";

sealed class ContactListState {}

final class ContactListInitial extends ContactListState {}

final class GettingContactList extends ContactListState {}

final class ContactLitsSearchResult extends ContactListState {
  ContactLitsSearchResult(this.contacts, this.query);
  List<ContactEntity> contacts;
  String query;
}

final class ContatListLoaded extends ContactListState {
  ContatListLoaded(this.contacts);
  List<ContactEntity> contacts;
}

final class ContactListFailed extends ContactListState {
  ContactListFailed({required this.error});

  final String error;
}
