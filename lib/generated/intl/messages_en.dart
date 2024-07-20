// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "badGatewayExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "We are experiencing temporary problems. Please try again later."),
        "badRequestExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "There was a problem with your request. Please check and try again."),
        "conflictExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "The request could not be completed due to a conflict."),
        "connectionTimeoutExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "We couldn’t connect. Please check your internet connection and try again"),
        "errorUserIsSignedOut": MessageLookupByLibrary.simpleMessage(
            "Session expired. Please sign in again."),
        "forbiddenExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "You are not allowed to access this resource."),
        "formatExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "Something went wrong with the data format"),
        "gatewayTimeoutExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "The request took too long to complete. Please try again later"),
        "internalServerErrorExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "We are experiencing technical difficulties. Please try again later."),
        "modelParsingExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "Something went wrong with the data parsing"),
        "noDataFound": MessageLookupByLibrary.simpleMessage("No data found"),
        "noInternetConnectionExceptionMsg":
            MessageLookupByLibrary.simpleMessage("No internet connection"),
        "notFoundExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "The page you requested could not be found."),
        "receiveTimeoutExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "We didn’t receive a response. Please try again."),
        "requestCancelledExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "Action you requested was cancelled."),
        "requestTimeoutExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "Request took too long to reach the server. Please try again later."),
        "sendTimeoutExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "It took too long to send your request. Please try again."),
        "serviceUnavailableExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "The service is unavailable. Please try again later."),
        "sessionExpiredExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "Your session expired due to password change. Please login again"),
        "somethingWentWrong":
            MessageLookupByLibrary.simpleMessage("Something went wrong"),
        "unauthorisedRequestExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "You are not authorized to access this resource. please sign in."),
        "unexpectedErrorExceptionMsg":
            MessageLookupByLibrary.simpleMessage("Unexpected error occurred"),
        "userDeletedExceptionMsg": MessageLookupByLibrary.simpleMessage(
            "Your account has been deleted. If this was unintended, please contact the admin.")
      };
}
