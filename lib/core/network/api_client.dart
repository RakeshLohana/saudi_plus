import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;

  ApiClient({required this.dio, required String language}) {
    dio.options.baseUrl = "http://api.saudi-plus.com";
    dio.options.headers['Accept-Language'] = language;
    dio.options.connectTimeout = const Duration(seconds: 5);
    dio.options.receiveTimeout = const Duration(seconds: 3);
  }

  Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
    return await dio.get(endpoint, queryParameters: params);
  }

  Future<Response> post(String endpoint, {dynamic data}) async {
    return await dio.post(endpoint, data: data,);
  }

}
