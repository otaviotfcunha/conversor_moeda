import 'package:conversor_moeda/repositories/dio_interceptor.dart';
import 'package:dio/dio.dart';

class CustomDio {
  final _dio = Dio();

  Dio get dio => _dio;

  CustomDio() {
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.interceptors.add(DioInterceptor());
  }
}
