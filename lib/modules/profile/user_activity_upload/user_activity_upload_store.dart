import 'package:locallense/values/enumeration.dart';
import 'package:mobx/mobx.dart';

part 'user_activity_upload_store.g.dart';

class UserActivityUploadStore = _UserActivityUploadStore
    with _$UserActivityUploadStore;

abstract class _UserActivityUploadStore with Store {
  NetworkState state = NetworkState.success;

  void continueToNextScreen() {}

  void skipToNextScreen() {}

  void uploadUserActivity() {}
}
