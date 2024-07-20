import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:locallense/firebase_options.dart';
import 'package:mobx/mobx.dart';

part 'login_screen_store.g.dart';

class LoginScreenStore = _LoginScreenStore with _$LoginScreenStore;

abstract class _LoginScreenStore with Store {
  Future<void> loginWithGoogleOnPress() async {
    late final GoogleSignIn googleSignIn;
    if (Platform.isAndroid) {
      googleSignIn = GoogleSignIn(
        clientId: DefaultFirebaseOptions.currentPlatform.androidClientId,
      );
    } else {
      googleSignIn = GoogleSignIn(
        clientId: DefaultFirebaseOptions.currentPlatform.iosClientId,
      );
    }
    await googleSignIn.signIn();
  }
}
