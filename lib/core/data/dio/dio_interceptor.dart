import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOjIsImlzcyI6Im9ubGluZWhyaXMiLCJpYXQiOjE2OTQyNTA5MjcsImV4cCI6MTY5NDMxMDkyN30.lww7lUK4lUP4O3ZvLM4CHKi8AQkx2_uc14zwBZSKrNoUVqm2bc-N3DjhdIaO5s-CJW4CIwkWc9xhCjmqFXEqJWCO_DxscxAMs7FS2bB6IDeRWMdKHd55zIDfnT5FdbhMYp9mZyAd0PZ8WT66o_MxWVJQ4znwNVnhqW5YuNgroPM'
    });
    debugPrint('REQUEST [${options.method}] => ${options.uri}');
    debugPrint('REQUEST DATA => ${jsonEncode(options.data)}');
    debugPrint('REQUEST HEADERS => ${options.headers}');
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    debugPrint('RESPONSE [${response.statusCode}]');
    debugPrint('RESPONSE DATA => ${jsonEncode(response.data)}');
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('ERROR [${err.response?.statusCode}] => PATH: ${err.response}');
    debugPrint('ERROR DATA => ${err.message}');
    return super.onError(err, handler);
  }
}
