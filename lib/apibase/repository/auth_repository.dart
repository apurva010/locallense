import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/firebase_options.dart';
import 'package:locallense/services/shared_prefs.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:locallense/values/strings.dart';

class AuthRepository {
  AuthRepository._();

  static final AuthRepository instance = AuthRepository._();

  late final GoogleSignIn googleSignIn;

  void initGoogleSignIn() {
    if (Platform.isAndroid) {
      googleSignIn = GoogleSignIn(
        clientId: DefaultFirebaseOptions.currentPlatform.androidClientId,
      );
    } else {
      googleSignIn = GoogleSignIn(
        clientId: DefaultFirebaseOptions.currentPlatform.iosClientId,
      );
    }
  }

  Future<void> navigateAfterAuthSuccess() async {
    appSession.isInsideApp = true;
    await navigation.pushNamedAndRemoveUntil(
      AppRoutes.basicDetailsScreen,
      (route) => false,
    );
  }

  Future<void> logOut() async {
    appSession.isInsideApp = false;
    await googleSignIn.signOut();
    await SharedPrefs.setSharedProperty(
      value: false,
      keyEnum: SharedPrefsKeys.isLoggedIn,
    );
    await navigation.pushNamedAndRemoveUntil(
      AppRoutes.loginScreen,
      (route) => false,
    );
  }
}
