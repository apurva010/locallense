import 'package:locallense/apibase/error_manager/network_exception.dart';
import 'package:locallense/app_global_variables.dart';

class RequestCancelled implements NetworkExceptions {
  const RequestCancelled();

  @override
  String get errorMessage => str.requestCancelledExceptionMsg;

  @override
  String toString() => errorMessage;
}

class ConnectionTimeout implements NetworkExceptions {
  const ConnectionTimeout();

  @override
  String get errorMessage => str.connectionTimeoutExceptionMsg;

  @override
  String toString() => errorMessage;
}

class SendTimeout implements NetworkExceptions {
  const SendTimeout();

  @override
  String get errorMessage => str.sendTimeoutExceptionMsg;

  @override
  String toString() => errorMessage;
}

class ReceiveTimeout implements NetworkExceptions {
  const ReceiveTimeout();

  @override
  String get errorMessage => str.receiveTimeoutExceptionMsg;

  @override
  String toString() => errorMessage;
}

class NoInternetConnection implements NetworkExceptions {
  const NoInternetConnection();

  @override
  String get errorMessage => str.noInternetConnectionExceptionMsg;

  @override
  String toString() => errorMessage;
}

class FormatException implements NetworkExceptions {
  const FormatException();

  @override
  String get errorMessage => str.formatExceptionMsg;

  @override
  String toString() => errorMessage;
}

class ModelParsingError implements NetworkExceptions {
  const ModelParsingError();

  @override
  String get errorMessage => str.modelParsingExceptionMsg;

  @override
  String toString() => errorMessage;
}

class DefaultError implements NetworkExceptions {
  const DefaultError(this.error);

  final String error;

  @override
  String get errorMessage => error;

  @override
  String toString() => errorMessage;
}

class UnexpectedError implements NetworkExceptions {
  const UnexpectedError();

  @override
  String get errorMessage => str.unexpectedErrorExceptionMsg;

  @override
  String toString() => errorMessage;
}

class BadRequest400 implements NetworkExceptions {
  const BadRequest400();

  @override
  String get errorMessage => str.badRequestExceptionMsg;

  @override
  String toString() => errorMessage;
}

class UnauthorisedRequest401 implements NetworkExceptions {
  const UnauthorisedRequest401();

  @override
  String get errorMessage => str.unauthorisedRequestExceptionMsg;

  @override
  String toString() => errorMessage;
}

class Forbidden403 implements NetworkExceptions {
  const Forbidden403();

  @override
  String get errorMessage => str.forbiddenExceptionMsg;

  @override
  String toString() => errorMessage;
}

class NotFound404 implements NetworkExceptions {
  const NotFound404({this.reason});

  final String? reason;

  @override
  String get errorMessage => reason ?? str.notFoundExceptionMsg;

  @override
  String toString() => errorMessage;
}

class RequestTimeout408 implements NetworkExceptions {
  const RequestTimeout408();

  @override
  String get errorMessage => str.requestTimeoutExceptionMsg;

  @override
  String toString() => errorMessage;
}

class Conflict409 implements NetworkExceptions {
  const Conflict409();

  @override
  String get errorMessage => str.conflictExceptionMsg;

  @override
  String toString() => errorMessage;
}

class SessionExpired419 implements NetworkExceptions {
  const SessionExpired419();

  @override
  String get errorMessage => str.sessionExpiredExceptionMsg;

  @override
  String toString() => errorMessage;
}

class UserDeleted420 implements NetworkExceptions {
  const UserDeleted420();

  @override
  String get errorMessage => str.userDeletedExceptionMsg;

  @override
  String toString() => errorMessage;
}

class InternalServerError500 implements NetworkExceptions {
  const InternalServerError500();

  @override
  String get errorMessage => str.internalServerErrorExceptionMsg;

  @override
  String toString() => errorMessage;
}

class BadGateway502 implements NetworkExceptions {
  const BadGateway502();

  @override
  String get errorMessage => str.badGatewayExceptionMsg;

  @override
  String toString() => errorMessage;
}

class ServiceUnavailable503 implements NetworkExceptions {
  const ServiceUnavailable503();

  @override
  String get errorMessage => str.serviceUnavailableExceptionMsg;

  @override
  String toString() => errorMessage;
}

class GatewayTimeout504 implements NetworkExceptions {
  const GatewayTimeout504();

  @override
  String get errorMessage => str.gatewayTimeoutExceptionMsg;

  @override
  String toString() => errorMessage;
}
