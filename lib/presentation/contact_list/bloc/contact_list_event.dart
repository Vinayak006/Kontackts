part of "contact_list_bloc.dart";

@immutable
sealed class ContactListEvent {}

class GetContactListEvent extends ContactListEvent {}

class SearchContactListEvent extends ContactListEvent {
  SearchContactListEvent({required this.query});

  final String query;
}
