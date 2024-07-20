import 'package:dio/dio.dart';
import 'package:locallense/apibase/model/invalid_response_model.dart';
import 'package:locallense/app_global_variables.dart';

/// We will use this response if the token is blank. If the token is blank then
/// we will not call the API and simply reject the request with this
/// pre-defined response.
class BlankTokenResponse extends Response<Map<String, dynamic>> {
  BlankTokenResponse({required super.requestOptions});

  @override
  int? get statusCode => 403;

  @override
  Map<String, dynamic> get data {
    return InvalidResponseModel(
      message: str.somethingWentWrong,
      code: 403,
    ).toJson();
  }
}
