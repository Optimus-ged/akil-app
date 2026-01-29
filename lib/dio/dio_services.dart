import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'endpoints.dart';
import 'interceptors.dart';

enum HttpMethode { get, post, put, patch, delete }

class DioService {
  final String? baseUrl;

  DioService({this.baseUrl});

  final Dio _dio = Dio(
    BaseOptions(
      validateStatus: (statusCose) => true,
      baseUrl: EndPoints.baseUrl,
      connectTimeout: const Duration(minutes: 3),
      receiveTimeout: const Duration(minutes: 3),
    ),
  )..interceptors.add(AppInterceptors());

  Future request(
    HttpMethode method,
    String path, {
    dynamic data,
    headers,
    CancelToken? cancelToken,
    extra,
    queryParameters,
    bool forceRefresh = true,
  }) async {
    Response result;
    try {
      if (baseUrl != null) {
        _dio.options.baseUrl = baseUrl!;
      }
      final queryParameters = <String, dynamic>{};
      result = await _dio.request(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: Options(
          method: method.toString().split('.').last,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
        data: data,
      );
      return result;
    } on Exception catch (ex) {
      log("EXCEPTION ::: occured $ex");
      rethrow;
    }
  }
}
