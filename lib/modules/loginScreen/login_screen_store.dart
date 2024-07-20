import 'package:locallense/app_global_variables.dart';
import 'package:locallense/services/shared_prefs.dart';
import 'package:mobx/mobx.dart';

import '../../values/enumeration.dart';

part 'login_screen_store.g.dart';

class LoginScreenStore = _LoginScreenStore with _$LoginScreenStore;

abstract class _LoginScreenStore with Store {
  Future<void> loginWithGoogleOnPress() async {
    await authRepository.googleSignIn.signIn();
    await SharedPrefs.setSharedProperty(
      value: true,
      keyEnum: SharedPrefsKeys.isLoggedIn,
    );
    await authRepository.navigateAfterAuthSuccess();
  }
}
