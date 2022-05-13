import 'package:boilerplate/app/ui/pages/home/presenter.dart';
import 'package:get_it/get_it.dart';

class PresenterModule {
  static void init() {
    var di = GetIt.I;
    di.registerFactory(() => HomeListPresenter(di.get()));
  }
}
