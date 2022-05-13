import 'package:boilerplate/app/ui/pages/home/controller.dart';
import 'package:get_it/get_it.dart';

class ControllerModule {
  static void init() {
    var di = GetIt.I;
    di.registerFactory(() => HomeController(di.get()));
  }
}
