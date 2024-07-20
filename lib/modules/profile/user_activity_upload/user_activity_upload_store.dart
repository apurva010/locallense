import 'package:locallense/app_global_variables.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:locallense/values/strings.dart';
import 'package:mobx/mobx.dart';

part 'user_activity_upload_store.g.dart';

class UserActivityUploadStore = _UserActivityUploadStore
    with _$UserActivityUploadStore;

abstract class _UserActivityUploadStore with Store {
  NetworkState state = NetworkState.success;

  void continueToNextScreen() {
    // just for next page for now
    navigation.pushNamed(AppRoutes.selectPreference);
  }

  void skipToNextScreen() {}

  void uploadUserActivity() {}
}
