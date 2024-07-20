import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/constants.dart';

// ignore_for_file: avoid_print
class APILogger {
  static const int _defaultPadding = 3;

  void printSuccessLog({
    required dynamic responseBody,
    required dynamic parameters,
    required String? url,
    required String? token,
    required String? apiMethod,
    String? requestTime,
    bool isRequest = true,
    int spacerLines = _defaultPadding,
  }) {
    final apiType = isRequest ? 'REQUEST' : 'RESPONSE';
    final data = '${">" * 40} $apiType ${"<" * 40}\n'
        ' Method        - $apiMethod\n'
        ' Request URL   - $url\n'
        ' UTC Time      - ${DateTime.now()}\n'
        ' Authentication Token - $token\n'
        ' X-Request-Timestamp - $requestTime\n'
        ' Parameters    - ${prettyJson(parameters)}\n'
        ' Body - ${prettyJson(responseBody)}\n'
        '${"-" * 100}\n';

    if (kDebugMode) {
      log(data.padding(spacerLines, '\n'));
    }
  }

  void printErrorLog({
    required dynamic responseBody,
    required dynamic parameters,
    required String? url,
    required String? token,
    required String? errorString,
    required int statusCode,
    String? deviceId,
    String? requestTime,
    int spacerLines = _defaultPadding,
  }) {
    final data = '${">" * 40} REQUEST ${"<" * 40} \n'
        'Request URL   - $url\n'
        'UTC Time      - ${DateTime.now()}\n'
        'Authentication Token - $token\n'
        'Device ID - $deviceId\n'
        'X-Request-Timestamp - $requestTime\n'
        'Parameters    - ${prettyJson(parameters)}\n'
        'Body - ${prettyJson(responseBody)}\n'
        '----------ERROR----------\n'
        'Status Code - $statusCode\n'
        'Message     - $errorString\n'
        '${"-" * 100}\n';

    if (kDebugMode) {
      log(data.padding(spacerLines, '\n'));
    }
  }

  String prettyJson(dynamic json) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(json);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(label: s.toString());
    }
    return Constants.empty;
  }
}
