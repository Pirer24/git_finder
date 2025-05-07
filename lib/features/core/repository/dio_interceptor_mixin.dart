import 'package:dio/dio.dart';

mixin DioInterceptorMixin {
  InterceptorsWrapper get dioInterceptor {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        const envToken = String.fromEnvironment('TOKEN');
        if (envToken.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $envToken';
        }
        return handler.next(options);
      },
    );
  }
}
