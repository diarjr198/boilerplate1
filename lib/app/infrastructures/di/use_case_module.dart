import 'package:boilerplate/use_cases/home_use_case.dart';
import 'package:get_it/get_it.dart';

class UseCaseModule {
  static void init() {
    var di = GetIt.I;
    di.registerFactory(() => GetHomeUseCase(di.get()));
  }
}
