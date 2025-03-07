import 'dart:async';

import 'package:dio/dio.dart';
import 'package:locallense/apibase/logger/api_logger.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/services/secure_storage.dart';
import 'package:locallense/values/enumeration.dart';

class HeaderInterceptor extends Interceptor {
  HeaderInterceptor({this.showLogs = true});

  final bool showLogs;

  final APILogger _logger = APILogger();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final internet = networkService.hasConnection;
    if (internet) {
      final token = await checkToken();
      if (token?.isNotEmpty ?? false) {
        options.headers.putIfAbsent('Authorization', () => 'Bearer $token');
      }
      _logger.printSuccessLog(
        apiMethod: options.method,
        responseBody: options.data.toString(),
        parameters: options.queryParameters,
        url: '${options.baseUrl}${options.path}',
        token: options.headers['Authorization'].toString(),
      );
    } else {
      // TODO(username): Show no internet dialog or toast here.
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.statusCode == 401) {
      // TODO(username): Handle token expired
    }
    _logger.printSuccessLog(
      apiMethod: response.requestOptions.method,
      responseBody: response.data.toString(),
      parameters: response.requestOptions.data as Object?,
      url: '${response.realUri.scheme}://${response.realUri.authority}'
          '${response.realUri.path}',
      token: response.headers.value('Authentication') ?? '',
      isRequest: false,
    );
    handler.resolve(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    if (err.response != null) {
      _logger.printErrorLog(
        responseBody: err.response?.data.toString(),
        parameters: err.response?.requestOptions.data as Object?,
        url:
            '${err.response?.realUri.scheme}://${err.response!.realUri.authority}'
            '${err.response?.realUri.path}',
        token: err.response?.headers.value('Authentication') ?? '',
        errorString: err.response?.statusMessage ?? 'No message found',
        statusCode: err.response?.statusCode ?? -1,
      );
    }

    handler.reject(err);
  }

  Future<String?> checkToken() async =>
      SecureStorage.getValue(key: SecureStorageKeys.kAccessToken);
}
