import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:locallense/apibase/api_service.dart';
import 'package:locallense/apibase/error_manager/network_exception.dart';
import 'package:locallense/apibase/intercepter/header_intercepter.dart';
import 'package:locallense/apibase/model/api_response_model.dart';
import 'package:locallense/apibase/model/api_result.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/model/request/login/google_login_req.dart';
import 'package:locallense/model/request/update_user/update_user_info_req.dart';
import 'package:locallense/model/request/user_question/post_user_question_req.dart';
import 'package:locallense/model/response/login/google_login_res.dart';
import 'package:locallense/model/response/place_type/place_type_res.dart';
import 'package:locallense/model/response/preferences/preferences_res.dart';
import 'package:locallense/model/response/questions/questions_res.dart';
import 'package:locallense/model/response/user/user_data_res.dart';

typedef ApiCallback<T> = Future<APIResponse<T>> Function();

class APIRepository {
  APIRepository._();

  static final APIRepository instance = APIRepository._();

  late ApiService apiService;

  bool hasLogoutActionPerformed = false;

  final dio = Dio(
    BaseOptions(baseUrl: flavorValues.baseUrl),
  );

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
      baseUrl: '',
    );
  }

  // ignore: unused_element
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

  Future<ApiResult<GoogleLoginRes>> sendGoogleLoginToken(
    String googleLoginToken,
  ) async {
    try {
      final response = await _apiCall<GoogleLoginRes>(
        () => apiService
            .getAuthToken(GoogleLoginReq(googleToken: googleLoginToken)),
      );
      return response;
    } catch (e) {
      return getSimplifiedError<GoogleLoginRes>(e);
    }
  }

  Future<ApiResult<UserDataRes>> getUserData() async {
    try {
      final response = await _apiCall<UserDataRes>(
        () => apiService.getUserData(),
      );
      return response;
    } catch (e) {
      return getSimplifiedError<UserDataRes>(e);
    }
  }

  Future<ApiResult<String>> updateUserData(
    UpdateUserInfoReq updateUserInfoReq,
  ) async {
    try {
      final response = await _apiCall<String>(
        () => apiService.updateUserData(updateUserInfoReq),
      );
      return response;
    } catch (e) {
      return getSimplifiedError<String>(e);
    }
  }

  Future<ApiResult<String>> deleteUserData() async {
    try {
      final response = await _apiCall<String>(
        () => apiService.deleteUserData(),
      );
      return response;
    } catch (e) {
      return getSimplifiedError<String>(e);
    }
  }

  Future<ApiResult<List<PlaceTypeRes>>> getPlaceTypes() async {
    try {
      final response = await _apiCall<List<PlaceTypeRes>>(
        () => apiService.placeTypes(),
      );
      return response;
    } catch (e) {
      return getSimplifiedError<List<PlaceTypeRes>>(e);
    }
  }

  Future<ApiResult<List<PreferencesRes>>> getPreferences() async {
    try {
      final response = await _apiCall<List<PreferencesRes>>(
        () => apiService.getPreferences(),
      );
      return response;
    } catch (e) {
      return getSimplifiedError<List<PreferencesRes>>(e);
    }
  }

  Future<ApiResult<List<QuestionsRes>>> getQuestions() async {
    try {
      final response = await _apiCall<List<QuestionsRes>>(
        () => apiService.getQuestions(),
      );
      return response;
    } catch (e) {
      return getSimplifiedError<List<QuestionsRes>>(e);
    }
  }

  Future<ApiResult<String>> postUserPrefs(List<String> preferences) async {
    try {
      final response = await _apiCall<String>(
        () => apiService.postUserPreferences(preferences),
      );
      return response;
    } catch (e) {
      return getSimplifiedError<String>(e);
    }
  }

  Future<ApiResult<String>> postUserQuestionAnswer(
    PostUserQuestionReq preferences,
  ) async {
    try {
      final response = await _apiCall<String>(
        () => apiService.postUserQuestionAnswer(preferences),
      );
      return response;
    } catch (e) {
      return getSimplifiedError<String>(e);
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

  ApiResult<T> getSimplifiedError<T>(Object error) {
    if (error is NetworkExceptions) {
      return ApiResult.failure(error);
    } else {
      return ApiResult.failure(
        NetworkExceptions.defaultError(
          str.somethingWentWrong,
        ),
      );
    }
  }
}
