import 'dart:async';
import 'dart:convert';

import 'package:locallense/apibase/repository/api_repository.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/model/response/user/user_data_res.dart';
import 'package:locallense/services/secure_storage.dart';
import 'package:locallense/services/shared_prefs.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/utils/helpers/helpers.dart';
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
        showErrorToast('Something went wrong while sign in with google');
        isGoogleLoginLoading = false;
        return false;
      }

      final apiToken = await APIRepository.instance
          .sendGoogleLoginToken(
            googleAuth!.idToken!,
          )
          .getResult();

      await SecureStorage.setValue(
        key: SecureStorageKeys.kAccessToken,
        value: apiToken.accessToken,
      );

      final userData = await APIRepository.instance.getUserData().getResult();

      await _storeUserData(userData);

      unawaited(authRepository.navigateAfterAuthSuccess());

      return true;
    } catch (e) {
      showErrorToast('Something went wrong while sign in with google');
      return false;
    } finally {
      isGoogleLoginLoading = false;
    }
  }

  Future<void> _storeUserData(UserDataRes userdata) async {
    await SharedPrefs.setSharedProperty(
      value: jsonEncode(
        userdata.toJson(),
      ),
      keyEnum: SharedPrefsKeys.userData,
    );

    await SharedPrefs.setSharedProperty(
      value: true,
      keyEnum: SharedPrefsKeys.isLoggedIn,
    );

    await SharedPrefs.setSharedProperty(
      keyEnum: SharedPrefsKeys.isLoggedIn,
      value: true,
    );
  }
}
