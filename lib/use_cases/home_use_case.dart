import 'package:boilerplate/app/infrastructures/contracts/base_use_case.dart';
import 'package:boilerplate/data/persistence/repositories/contracts/list_repository.dart';
import 'package:boilerplate/domains/post_domain.dart';

class GetHomeUseCase extends BaseUseCase<List<Home>, Map<String, String>> {
  final HomeRepository _homeRepository;

  GetHomeUseCase(this._homeRepository);

  @override
  Future<List<Home>> getData(Map<String, String>? params) {
    return _homeRepository.getHomeList(params ?? {});
  }
}
