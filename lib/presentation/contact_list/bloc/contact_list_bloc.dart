import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "../../../core/resources/data_state.dart";
import "../../../domain/entities/contact_entity.dart";
import "../../../domain/usecases/get_contact_list.dart";

part "contact_list_event.dart";
part "contact_list_state.dart";

class ContactListBloc extends Bloc<ContactListEvent, ContactListState> {
  ContactListBloc({required this.getContactListUseCase})
      : super(ContactListInitial()) {
    on<GetContactListEvent>(getContactListEvent);
    on<SearchContactListEvent>(searchContactListEvent);
  }

  final GetContactListUseCase getContactListUseCase;

  List<ContactEntity> contacts = <ContactEntity>[];

  void searchContactListEvent(
    final SearchContactListEvent event,
    final Emitter<ContactListState> emit,
  ) {
    final String nameQuery = event.query;
    if (nameQuery.isEmpty) {
      emit(ContatListLoaded(contacts));
    } else {
      final List<ContactEntity> filteredList = contacts
          .where(
            (final ContactEntity e) =>
                e.name.toLowerCase().contains(event.query.toLowerCase()),
          )
          .toList();
      emit(
        ContactLitsSearchResult(filteredList, nameQuery),
      );
    }
  }

  Future<void> getContactListEvent(
    final ContactListEvent event,
    final Emitter<ContactListState> emit,
  ) async {
    final DataState<List<ContactEntity>> contactsResponse =
        await getContactListUseCase();
    if (contactsResponse.isOk) {
      contacts = contactsResponse.data!;
      emit(ContatListLoaded(contacts));
    } else {
      emit(ContactListFailed(error: contactsResponse.error!));
    }
  }
}
