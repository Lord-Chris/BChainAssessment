import 'package:dio/dio.dart';

import '../../../../core/app/_app.dart';

class NetworkLoggerInterceptor implements Interceptor {
  final _logger = getLogger('NetworkLoggerInterceptor');
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e(
      '\n'
      '---ENDPOINT: ${err.requestOptions.uri}\n'
      '---STATUSCODE: ${err.error}\n'
      '---MESSAGE: ${err.response?.data ?? err.message}\n'
      '\n',
    );
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.d(
      '\n'
      '>>>METHOD: ${options.method}\n'
      '>>>ENDPOINT: ${options.uri}\n'
      '>>>HEADERS: ${options.headers}\n'
      '>>>DATA: ${options.data ?? options.queryParameters}\n'
      '\n',
    );
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.d(
      '\n'
      '<<<ENDPOINT: ${response.requestOptions.uri}\n'
      '<<<STATUSCODE: ${response.statusCode}\n'
      '<<<DATA: ${response.data}\n'
      '\n',
    );
    handler.next(response);
  }
}
