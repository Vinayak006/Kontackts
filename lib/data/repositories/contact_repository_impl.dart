import "../../core/resources/data_state.dart";
import "../../core/services/permission_service.dart";
import "../../domain/repositories/contact_repository.dart";
import "../models/contact_model.dart";
import "../services/contact_api_service.dart";

class ContactRepositoryImpl implements ContactRepository {
  ContactRepositoryImpl({required final ContactApiService apiService})
      : _apiService = apiService;

  final ContactApiService _apiService;

  @override
  Future<DataState<List<ContactModel>>> getContacts() async {
    if (await PermissionService().requestContactPermission()) {
      return _apiService.getContacts();
    }
    return DataFailed<List<ContactModel>>(error: "Permission rejected");
  }
}
