import 'dart:async';

import 'package:locallense/app_global_variables.dart';
import 'package:locallense/services/secure_storage.dart';
import 'package:locallense/services/shared_prefs.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:mobx/mobx.dart';

part 'login_screen_store.g.dart';

class LoginScreenStore = _LoginScreenStore with _$LoginScreenStore;

abstract class _LoginScreenStore with Store {
  @observable
  bool isGoogleLoginLoading = false;

  Future<bool> loginWithGoogleOnPress() async {
    isGoogleLoginLoading = true;
    try {
      final signInResponse = await authRepository.googleSignIn.signIn();
      final googleAuth = await signInResponse?.authentication;

      if (googleAuth?.idToken == null) {
        // TODO(Sahil): Show SnakBar
        isGoogleLoginLoading = false;
        return false;
      }

      await SharedPrefs.setSharedProperty(
        value: true,
        keyEnum: SharedPrefsKeys.isLoggedIn,
      );
      await authRepository.navigateAfterAuthSuccess();

      // TODO(Sahil): Add Token
      await SecureStorage.setValue(
        key: SecureStorageKeys.kAccessToken,
        value: 'token',
      );
      await SharedPrefs.setSharedProperty(
        keyEnum: SharedPrefsKeys.isLoggedIn,
        value: true,
      );
      return true;
    } catch (e) {
      // TODO(Sahil): Show SnakBar
      return false;
    }
  }
}
