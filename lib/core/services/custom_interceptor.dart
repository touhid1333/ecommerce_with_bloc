import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerce_with_bloc/domain/local_storage.dart';

class CustomInterceptors extends InterceptorsWrapper {
  CustomInterceptors({
    required Dio dio,
    required LocalStorage localStorage,
  })  : _localStorage = localStorage,
        _dio = dio;

  final LocalStorage _localStorage;
  final Dio _dio;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = _localStorage.token;

    if (token != '') {
      options.headers.addAll({
        'Authorization': "Bearer $token",
      });
    }

    var data = options.data ?? {};

    log('url: ${options.baseUrl}${options.path} payload:${options.queryParameters} // ${options.data}  headers: ${options.headers}');
    return handler.next(options.copyWith(data: data));
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    log('❌ Url: ${err.response?.realUri.path} Error: ${err.error}, Status Code: ${err.response?.statusCode}');
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('✅ Url: ${response.realUri.path} \n Head \n Data: ${jsonEncode(response.data)}');
    return handler.next(response);
  }
}
