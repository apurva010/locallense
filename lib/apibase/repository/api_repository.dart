import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:locallense/apibase/api_service.dart';
import 'package:locallense/apibase/error_manager/network_exception.dart';
import 'package:locallense/apibase/intercepter/header_intercepter.dart';
import 'package:locallense/apibase/model/api_response_model.dart';
import 'package:locallense/apibase/model/api_result.dart';
import 'package:locallense/app_global_variables.dart';

typedef ApiCallback<T> = Future<APIResponse<T>> Function();

class APIRepository {
  APIRepository._();

  static final APIRepository instance = APIRepository._();

  late ApiService apiService;

  bool hasLogoutActionPerformed = false;

  final dio = Dio();

  final logInterceptor = LogInterceptor(
    requestBody: !kReleaseMode,
    responseBody: !kReleaseMode,
    //ignore:avoid_redundant_argument_values
    request: !kReleaseMode,
    //ignore:avoid_redundant_argument_values
    requestHeader: !kReleaseMode,
    //ignore:avoid_redundant_argument_values
    responseHeader: !kReleaseMode,
  );

  void initialise() {
    dio.interceptors.add(HeaderInterceptor());
    apiService = ApiService(
      dio: dio,
      baseUrl: flavorValues.baseUrl,
    );
  }

  Future<ApiResult<T>> _apiCall<T>(ApiCallback<T> request) async {
    if (!networkService.hasConnection) {
      await checkOrThrowNoInternetError();
    }
    try {
      final response = await request();
      return ApiResult.success(
        response.data,
        response.message,
      );
    } catch (e) {
      return ApiResult.failure(NetworkExceptions.getDioException(e));
    }
  }

  /// If there is no internet connection, we will wait for 5 seconds before
  /// throwing an exception. The reason for doing this is because in iOS
  /// if the app is ideal and suddenly user wakes up the app, the internet
  /// connection is not working immediately. So to prevent "No internet" toast
  /// we are doing this.
  Future<void> checkOrThrowNoInternetError() async {
    await Future<void>.delayed(const Duration(seconds: 5));

    /// If after 3 seconds still there is no internet connection, then throw
    /// the exception. If we have the internet connection then continue with
    /// the flow.
    if (!await networkService.isConnected()) {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
