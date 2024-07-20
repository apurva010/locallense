import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:screwdriver/screwdriver.dart';

/// class to check for internet availability
class NetworkService {
  NetworkService._();

  static NetworkService instance = NetworkService._();

  //flutter_connectivity
  final Connectivity _connectivity = Connectivity();

  //This tracks the current connection status
  bool hasConnection = false;

  //This is how we'll allow subscribing to connection changes
  final StreamController<dynamic> connectionChangeController =
      StreamController.broadcast();

  Stream<dynamic> get connectionChange => connectionChangeController.stream;

  //Hook into flutter_connectivity's Stream to listen for changes
  //And check the connection status out of the gate
  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    Connectivity().checkConnectivity().then(_checkConnection);
  }

  //flutter_connectivity's listener
  void _connectionChange(List<ConnectivityResult> result) {
    _checkConnection(result);
  }

  //The test to actually see if there is a connection
  Future<bool> _checkConnection(List<ConnectivityResult> result) async {
    final previousConnection = hasConnection;

    if (result.isNullOrEmpty || result.first == ConnectivityResult.none) {
      hasConnection = false;
      connectionChangeController.add(hasConnection);
      return hasConnection;
    }
    try {
      final result = await InternetAddress.lookup('google.com');
      hasConnection = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      hasConnection = false;
    }

    //The connection status changed send out an update to all listeners
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return _checkConnection(result);
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint(e.toString());
      return hasConnection;
    }
  }

  //  A clean up method to close our StreamController
  //  Because this is meant to exist through the entire application life cycle
  //  this isn't really an issue
  void dispose() {
    connectionChangeController.close();
  }
}
