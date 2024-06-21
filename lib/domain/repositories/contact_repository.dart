import "../../core/resources/data_state.dart";
import "../entities/contact_entity.dart";

abstract class ContactRepository {
  ContactRepository._();
  Future<DataState<List<ContactEntity>>> getContacts();
}
