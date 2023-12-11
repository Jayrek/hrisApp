import 'package:dio/dio.dart';
import 'dio_interceptor.dart';

class DioClient {
  static final baseOptions = BaseOptions(
    // baseUrl: 'https://demo.calisg.com/hris/api',
    // baseUrl: 'https://rtdigiti.myhris.info/api',
    baseUrl: 'https://rtdigit.com/api',
    responseType: ResponseType.json,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  );

  static Dio dioInstance() => Dio(baseOptions);

  static Dio addInterceptors(Dio dio) =>
      dio..interceptors.add(DioInterceptor());

  static final dio = dioInstance();
  static final baseApi = addInterceptors(dio);

  Future<Response> getDio(String url, {dynamic data}) async {
    try {
      final response = await baseApi.get(url, queryParameters: data);
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> postDio(String url, {required dynamic data}) async {
    try {
      final response = await baseApi.post(url, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> putDio(String url, dynamic data) async {
    Response response;
    try {
      response = await baseApi.put(url, data: data);
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<Response> deleteDio(String url) async {
    try {
      Response response = await baseApi.delete(url);
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
