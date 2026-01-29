import 'dart:developer';

import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    log("--> ${options.method.toUpperCase()} ${"${options.baseUrl}${options.path}"}");
    log("Headers:");
    options.headers.forEach((k, v) => log('$k: $v'));

    log("queryParameters:");
    options.queryParameters.forEach((k, v) => log('$k: $v'));

    if (options.data != null) {
      log("Body: ${options.data}");
      // if (options.data?.fields != null) {
      //   log("Body: ${options.data.fields}");
      // } else {
      //   log("Body: ${options.data}");
      // }
    }
    log("--> END ${options.method.toUpperCase()}");
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    log(
      "<-- ${response.statusCode} ${((response.requestOptions.baseUrl + response.requestOptions.path))}",
    );
    log("Headers:");
    response.headers.forEach((k, v) => log('$k: $v'));
    log("Response: ${response.data}");
    log("<-- END HTTP");
    return super.onResponse(response, handler);
  }

  @override
  Future onError(err, ErrorInterceptorHandler handler) async {
    log("<-- ${err.message} ${(err.response?.requestOptions != null ? (err.response?.requestOptions.baseUrl) : 'URL')}");
    log("${err.response?.requestOptions.path}");
    log("${err.response != null ? err.response?.data : 'Unknown Error'}");
    log("<-- End error");

    return super.onError(err, handler);
  }
}
