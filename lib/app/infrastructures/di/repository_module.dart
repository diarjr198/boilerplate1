import 'package:boilerplate/data/persistence/repositories/contracts/list_repository.dart';
import 'package:boilerplate/data/persistence/repositories/implementation/list_implementation.dart';
import 'package:get_it/get_it.dart';

class RepositoryModule {
  static void init() {
    var di = GetIt.I;
    di.registerFactory<HomeRepository>(
      () => HomeApiRepository(
        di.get(),
        di.get(),
        di.get(),
      ),
    );
  }
}
