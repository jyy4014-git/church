import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:church_navigation/utils/exceptions.dart';

class DioErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('DioError: ${err.message}');
    debugPrint('DioError Type: ${err.type}');
    debugPrint('DioError Response: ${err.response}');

    if (err.error is CustomException) {
      handler.next(err);
    } else {
      if (err.response != null) {
        // 서버에서 에러 응답을 받은 경우
        final statusCode = err.response!.statusCode;
        final message =
            err.response!.data['message'] ??
            'Unknown error'; // 서버에서 제공하는 메시지 사용
        handler.next(
          DioException(
            requestOptions: err.requestOptions,
            error: CustomException(message: message, statusCode: statusCode!),
          ),
        );
      } else {
        handler.next(
          DioException(
            requestOptions: err.requestOptions,
            error: CustomException(message: 'Network error', statusCode: 0),
          ),
        );
      }
    }
  }
}
