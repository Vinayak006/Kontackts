import "package:get_it/get_it.dart";

import "data/repositories/contact_repository_impl.dart";
import "data/services/contact_api_service.dart";
import "domain/repositories/contact_repository.dart";

final GetIt locator = GetIt.I;

void injectDependency() {
  locator
    ..registerSingleton<ContactApiService>(ContactApiService())
    ..registerSingleton<ContactRepository>(
      ContactRepositoryImpl(apiService: locator()),
    );
}
