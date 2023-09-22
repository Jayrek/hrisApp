import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../app/common/util/key_strings.dart';
import '../../domain/manager/shared_prefs_manager.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token =
        await SharedPrefsManager().getStringPref(KeyStrings.spTokenKey);
    options.headers.addAll({
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token'
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
