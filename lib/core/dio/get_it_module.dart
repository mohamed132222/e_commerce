import 'package:dio/dio.dart';
import 'package:e_commerce/api/api_endpoint.dart';
import 'package:e_commerce/api/api_services.dart';
import 'package:e_commerce/core/dio/dio_interceptor.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class GetItModule {
  @singleton
  BaseOptions get provideBaseOptions => BaseOptions(
    baseUrl: ApiEndpoint.baseUrl,
    receiveTimeout: Duration(seconds: 5),
    sendTimeout: Duration(seconds: 5),
  );

  @singleton
  PrettyDioLogger get providePrettyDioLogger => PrettyDioLogger(
    error: true,
    requestBody: true,
    responseHeader: true,
    request: true,
    requestHeader: true,
    responseBody: true,
  );

  @singleton
  Dio provideDio(BaseOptions baseOptions, PrettyDioLogger prettyDioLogger) {
    var dio = Dio(baseOptions);
    dio.interceptors.add(DioInterceptor());
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @singleton
  ApiServices get provideApiServices =>
      ApiServices(provideDio(provideBaseOptions, providePrettyDioLogger));
}
