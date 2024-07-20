import 'package:dio/dio.dart';
import 'package:locallense/app_global_variables.dart';

import '../../model/response/invalid_response_model.dart';

/// We will use this response if the user is signed-out. If the user is signed
/// out then we will not call the API and simply reject the request with this
/// pre-defined response.
class UserSignOutResponse extends Response<Map<String, dynamic>> {
  UserSignOutResponse({required super.requestOptions});

  @override
  int? get statusCode => 401;

  @override
  Map<String, dynamic> get data {
    return InvalidResponseModel(
      message: str.errorUserIsSignedOut,
    ).toJson();
  }
}
