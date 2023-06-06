// Package imports:
import 'package:dio/dio.dart';

class DioSettings {
  DioSettings() {
    setUp();
  }
  final Dio dio = Dio(BaseOptions(
      baseUrl: 'https://identification.cbk.kg/api/',
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
     ));

  void setUp() {
    final interceptors = dio.interceptors;

    interceptors.clear();
    final headerInterceptors = QueuedInterceptorsWrapper();
    final logInterceptor = LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true);
    interceptors.addAll(
      [headerInterceptors, logInterceptor],
    );
  }
}
