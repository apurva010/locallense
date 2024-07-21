import 'dart:async';
import 'dart:convert';

import 'package:locallense/model/response/user/user_data_res.dart';
import 'package:locallense/services/shared_prefs.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:mobx/mobx.dart';

part 'profile_screen_store.g.dart';

class ProfileScreenStore = _ProfileScreenStore with _$ProfileScreenStore;

abstract class _ProfileScreenStore with Store {
  _ProfileScreenStore() {
    initState();
  }

  @observable
  UserDataRes? userDataRes;

  Future<void> initState() async {
    final data =
        SharedPrefs.getSharedProperty(keyEnum: SharedPrefsKeys.userData);
    if (data is String? && data.isNotNullAndNotEmpty) {
      final userData = jsonDecode(data!) as Map<String, dynamic>;
      userDataRes = UserDataRes.fromJson(userData);
    }
  }
}
