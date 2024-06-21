import "../../core/resources/data_state.dart";
import "../../core/usecases/usecases.dart";
import "../entities/contact_entity.dart";
import "../repositories/contact_repository.dart";

class GetContactListUseCase
    extends Usecases<DataState<List<ContactEntity>>, void> {
  GetContactListUseCase({required final ContactRepository repository})
      : _repository = repository;

  final ContactRepository _repository;

  @override
  Future<DataState<List<ContactEntity>>> call([final void params]) async =>
      _repository.getContacts();
}
