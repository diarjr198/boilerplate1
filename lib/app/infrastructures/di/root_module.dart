import 'package:boilerplate/app/infrastructures/endpoints.dart';
import 'package:boilerplate/app/infrastructures/persistence/api_service.dart';
import 'package:boilerplate/data/infrastructures/api_service_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

class RootModule {
  static Future<void> init() async {
    var di = GetIt.I;
    di.registerLazySingleton(() => Endpoints(dotenv.env['BASE_URL'] ?? ''));
    di.registerFactory(() {
      var dio = Dio();
      dio.options.connectTimeout = 10 * 1000;
      dio.options.receiveTimeout = 10 * 1000;

      // var userData = di.get<UserData>();
      var endpoints = di.get<Endpoints>();

      // use for log response and request data
      // if (!kReleaseMode) {
      //   dio.interceptors.add(DioInterceptor());
      // }

      // dio.interceptors.add(
      //   DioCacheManager(CacheConfig(baseUrl: endpoints.baseUrl)).interceptor,
      // );

      // var tokenCheck = userData.token?.isNotEmpty ?? false;
      // var token = userData.token ?? '';

      // if (userData.token != null && tokenCheck)
      //   dio.options.headers['Authorization'] = 'Bearer ' + token;
      dio.options.baseUrl = endpoints.baseUrl;

      // (dio.transformer as DefaultTransformer).jsonDecodeCallback = _parseJson;
      return dio;
    });
    di.registerFactory<ApiServiceInterface>(
      () => ApiService(di.get()),
    );
  }
}
