import 'package:boilerplate/data/persistence/mappers/home_list_mapper.dart';
import 'package:get_it/get_it.dart';

class MapperModule {
  static void init() {
    var di = GetIt.I;
    di.registerLazySingleton(() => HomeListMapper());
  }
}
