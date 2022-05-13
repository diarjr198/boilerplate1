import 'package:boilerplate/app/infrastructures/endpoints.dart';
import 'package:boilerplate/app/infrastructures/persistence/mappers/home_list_mapper.dart';
import 'package:boilerplate/data/infrastructures/api_service_interface.dart';
import 'package:boilerplate/data/persistence/repositories/contracts/list_repository.dart';
import 'package:boilerplate/domains/post_domain.dart';

class HomeApiRepository implements HomeRepository {
  final ApiServiceInterface _service;
  final Endpoints _endpoints;
  final HomeListMapper _mapper;

  HomeApiRepository(this._service, this._endpoints, this._mapper);

  @override
  Future<List<Home>> getHomeList(
    Map<String, String> params,
  ) async {
    try {
      var response =
          await _service.invokeHttp(_endpoints.homeList(), RequestType.GET);

      var homeList = (response ?? []) as List<dynamic>;
      return homeList.map((json) => _mapper.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
