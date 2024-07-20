import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:screwdriver/screwdriver.dart';

import 'network_exception_classes.dart';

abstract class NetworkExceptions implements Exception {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.connectionTimeout() = ConnectionTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.receiveTimeout() = ReceiveTimeout;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.modelParsingError() = ModelParsingError;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  const factory NetworkExceptions.badRequest400() = BadRequest400;

  const factory NetworkExceptions.unauthorisedRequest401() =
      UnauthorisedRequest401;

  const factory NetworkExceptions.forbidden403() = Forbidden403;

  const factory NetworkExceptions.notFound404() = NotFound404;

  const factory NetworkExceptions.requestTimeout408() = RequestTimeout408;

  const factory NetworkExceptions.conflict409() = Conflict409;

  const factory NetworkExceptions.sessionExpired419() = SessionExpired419;

  const factory NetworkExceptions.userDeleted420() = UserDeleted420;

  const factory NetworkExceptions.internalServerError500() =
      InternalServerError500;

  const factory NetworkExceptions.badGateway502() = BadGateway502;

  const factory NetworkExceptions.serviceUnavailable503() =
      ServiceUnavailable503;

  const factory NetworkExceptions.gatewayTimeout504() = GatewayTimeout504;

  factory NetworkExceptions.getDioException(dynamic error) {
    NetworkExceptions exception;
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              exception = const NetworkExceptions.requestCancelled();
            case DioExceptionType.connectionTimeout:
              exception = const NetworkExceptions.connectionTimeout();
            case DioExceptionType.receiveTimeout:
              exception = const NetworkExceptions.receiveTimeout();
            case DioExceptionType.sendTimeout:
              exception = const NetworkExceptions.sendTimeout();
            case DioExceptionType.connectionError:
            case DioExceptionType.badCertificate:
            case DioExceptionType.unknown:
              exception = const NetworkExceptions.noInternetConnection();
            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                case 400: // Bad Request
                  exception = const NetworkExceptions.badRequest400();
                case 401: // Unauthorised
                  exception = const NetworkExceptions.unauthorisedRequest401();
                case 403: // Forbidden
                  exception = const NetworkExceptions.forbidden403();
                case 404: // Not Found
                  exception = const NetworkExceptions.notFound404();
                case 408: // Request Timeout
                  exception = const NetworkExceptions.requestTimeout408();
                case 409: // Conflict
                  exception = const NetworkExceptions.conflict409();

                /// Below case 419: is for to forcefully logout user from the
                /// application. e.g. in case of change and forgot password
                case 419: // Session expired
                  exception = const NetworkExceptions.sessionExpired419();

                /// Below case 420: is for to forcefully logout user from the
                /// application. This will appear when user is deleted and
                /// session is still opened in this device.
                case 420: // Unauthorised
                  exception = const NetworkExceptions.userDeleted420();
                case 500: // Internal server error
                  exception = const NetworkExceptions.internalServerError500();
                case 502: // Bad Gateway
                  exception = const NetworkExceptions.badGateway502();
                case 503: // Service unavailable
                  exception = const NetworkExceptions.serviceUnavailable503();
                case 504: // Gateway timeout
                  exception = const NetworkExceptions.gatewayTimeout504();
                default:
                  final statusCode = error.response?.statusCode;
                  final statusMessage = error.response?.statusMessage;
                  final errorMsg =
                      statusCode != null && statusMessage.isNotNullOrBlank
                          ? kDebugMode
                              ? '$statusCode $statusMessage'
                              : statusMessage!
                          : str.somethingWentWrong;
                  exception = NetworkExceptions.defaultError(errorMsg);
              }
          }
        } else if (error is SocketException) {
          exception = const NetworkExceptions.noInternetConnection();
        } else {
          exception = const NetworkExceptions.unexpectedError();
        }
        return exception;
      } on FormatException {
        exception = const NetworkExceptions.formatException();
      } catch (_) {
        exception = const NetworkExceptions.unexpectedError();
      }
    } else {
      if (error is TypeError) {
        // Print Stack to track exact location of Class having issue
        debugPrintStack(stackTrace: error.stackTrace);
        exception = const NetworkExceptions.modelParsingError();
      } else {
        exception = const NetworkExceptions.unexpectedError();
      }
    }
    debugPrint(error.toString());
    return exception;
  }

  String get errorMessage;

  @override
  String toString() => errorMessage;
}
