import 'dart:convert';

import 'package:boilerplate/data/infrastructures/api_service_interface.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class ApiService extends ApiServiceInterface {
  late final Dio _dio;

  ApiService(this._dio);

  // send http request
  Future<dynamic> invokeHttp(
    dynamic url,
    RequestType type, {
    Map<String, String>? headers,
    dynamic body,
    String? contentType,
    Map<String, dynamic>? params,
    Encoding? encoding,
    bool needThrowError = true,
  }) async {
    Response response;

    // this.needThrowError = needThrowError;

    try {
      response = await _invoke(
        url,
        type,
        headers: headers,
        body: body,
        params: params,
      );
    } catch (error) {
      rethrow;
    }

    return response.data;
  }

  // setup requiest type and configuration
  Future<Response> _invoke(
    dynamic url,
    RequestType type, {
    Map<String, String>? headers,
    dynamic body,
    Map<String, dynamic>? params,
  }) async {
    Response response;

    try {
      switch (type) {
        case RequestType.GET:
          response = await _dio.get(
            url,
            options: buildCacheOptions(
              Duration(days: 1),
              options: Options(headers: headers),
              forceRefresh: true,
              maxStale: Duration(days: 1),
            ),
            queryParameters: params,
          );
          break;
        case RequestType.POST:
          response = await _dio.post(
            url,
            data: body,
            options: Options(headers: headers),
          );
          break;
        case RequestType.PUT:
          response = await _dio.put(
            url,
            data: body,
            options: Options(headers: headers),
          );
          break;
        case RequestType.PATCH:
          response = await _dio.patch(
            url,
            data: body,
            options: Options(headers: headers),
          );
          break;
        case RequestType.DELETE:
          response = await _dio.delete(url, options: Options(headers: headers));
          break;
      }

      if (response.data['success'] == false) {
        throw DioError(
          response: Response(
            statusCode: response.statusCode,
            data: {
              'message': response.data['message'],
              'origin': response.data['origin'],
              'data': response.data['data']
            },
            requestOptions: RequestOptions(
              data: {
                'message': response.data['message'],
                'origin': response.data['origin'],
                'data': response.data['data']
              },
              path: '',
            ),
          ),
          requestOptions: RequestOptions(
            data: {
              'message': response.data['message'],
              'origin': response.data['origin'],
              'data': response.data['data']
            },
            path: '',
          ),
        );
      }

      // TODO: Unused for right now.
      // notifySucces(response);
      return response;
    } on DioError catch (e) {
      // notifyError(e.response);
      rethrow;
    } catch (error) {
      rethrow;
    }
  }

  // void notifyError(Response? resp) {
  //   if (!needThrowError) return;

  //   _eventBus.fire(
  //     DioErrorEvent(
  //       code: resp?.statusCode ?? 408,
  //       message: resp == null || resp.data is String
  //           ? 'Connection Timeout'
  //           : resp.data['message'],
  //       origin: resp == null || resp.data is String
  //           ? 'default'
  //           : resp.data['origin'],
  //     ),
  //   );
  // }

  // void notifySucces(Response? resp) {
  //   var defaultMessage = "no response message from API";

  //   _eventBus.fire(
  //     DioSuccesEvent(message: resp?.data['message'] ?? defaultMessage),
  //   );
  // }
}
