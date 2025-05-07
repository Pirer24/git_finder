import 'package:dio/dio.dart';

import 'dio_interceptor_mixin.dart';

abstract class CoreRepository {
  Future<T> get<T>({
    required String url,
    Map<String, dynamic>? queryParameters,
  });
}

class CoreRepositoryImpl with DioInterceptorMixin implements CoreRepository {
  final Dio _dio = Dio();

  CoreRepositoryImpl() {
    _dio.interceptors.add(dioInterceptor);
  }

  @override
  Future<T> get<T>({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await _dio.get(
      url,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
