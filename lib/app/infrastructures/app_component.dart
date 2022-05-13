import 'package:boilerplate/app/infrastructures/di/controller_module.dart';
import 'package:boilerplate/app/infrastructures/di/mapper_module.dart';
import 'package:boilerplate/app/infrastructures/di/presenter_module.dart';
import 'package:boilerplate/app/infrastructures/di/repository_module.dart';
import 'package:boilerplate/app/infrastructures/di/root_module.dart';
import 'package:boilerplate/app/infrastructures/di/use_case_module.dart';

class AppComponent {
  static Future<void> init() async {
    await RootModule.init();
    MapperModule.init();
    RepositoryModule.init();
    UseCaseModule.init();
    PresenterModule.init();
    ControllerModule.init();
  }
}
