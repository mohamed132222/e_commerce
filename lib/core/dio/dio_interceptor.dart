import 'package:dio/dio.dart';
import 'package:e_commerce/core/exception/app_exception.dart';

class DioInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    AppException appException;
    String message = "some thing went wrong";
    final responseBody = err.response?.data;
    if (responseBody is Map) {
      message =
          responseBody["errors"]?["msg"] ?? responseBody["message"] ?? message;
    }
    switch (err.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
        appException = NetworkException(
          message: "please check the internet connection",
        );
        break;
      case DioExceptionType.badResponse:
        appException = ServerException(
          message: message,
          statusCode: err.response?.statusCode,
        );
        break;
      case DioExceptionType.cancel:
        appException = UnExpectedException(message: "request canceled");
        break;
      case DioExceptionType.unknown:
        appException = UnExpectedException(message: message);
        break;
      default:
        appException = UnExpectedException(message: message);
        break;
    }

    handler.next(
      DioException(
        requestOptions: err.requestOptions,
        type: err.type,
        error: appException,
        response: err.response,
      ),
    );
  }
}
