import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:locallense/app_global_variables.dart';
import 'package:locallense/model/request/pref/pref_req_dm.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/utils/helpers/helpers.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:mobx/mobx.dart';

import '../../../../model/response/preferences/preferences_res.dart';

part 'select_preference_store.g.dart';

class SelectPreferenceStore = _SelectPreferenceStore
    with _$SelectPreferenceStore;

abstract class _SelectPreferenceStore with Store {
  _SelectPreferenceStore({
    required List<PreferencesRes> preSelectPreferences,
    // ignore: unused_element
    this.fetchSelectedData = false,
  }) {
    getPref(preSelectPreferences);
  }

  final bool fetchSelectedData;

  @observable
  NetworkState fetchNetworkState = NetworkState.idle;

  @observable
  NetworkState postNetworkState = NetworkState.idle;

  ObservableList<Observable<PreferencesRes>> preferenceList = ObservableList();

  Future<void> getPref(List<PreferencesRes> preSelectPreferences) async {
    try {
      var selectedPref = preSelectPreferences;
      fetchNetworkState = NetworkState.loading;
      if (fetchSelectedData) {
        selectedPref = await apiRepository.getSelectedPreferences().getResult();
      }
      final result = await apiRepository.getPreferences().getResult();
      preferenceList.addAll(result.map(Observable.new));
      preSelectUserPreferences(selectedPref);
      fetchNetworkState = NetworkState.success;
    } catch (e, s) {
      fetchNetworkState = NetworkState.error;
      showErrorToast(e.toString());
      debugPrint(e.toString());
      debugPrintStack(label: s.toString());
    }
  }

  void preSelectUserPreferences(List<PreferencesRes> preSelect) {
    for (final element in preSelect) {
      for (final value in preferenceList) {
        if (value.value.preference == element.preference) {
          value.value.isSelected = true;
          value.reportChanged();
          break;
        }
      }
    }
  }

  void selectPreference(int index) {
    final preference = preferenceList.elementAt(index);
    preference.value.isSelected = !preference.value.isSelected;
    preference.reportChanged();
  }

  Future<void> postSelectPref() async {
    try {
      postNetworkState = NetworkState.loading;
      final pref = preferenceList
          .where((e) => e.value.isSelected)
          .map((e) => e.value.id)
          .toList();
      await apiRepository.postUserPrefs(PrefReqDm(preferences: pref));
      postNetworkState = NetworkState.success;
    } catch (e, s) {
      postNetworkState = NetworkState.error;
      showErrorToast(e.toString());
      debugPrint(e.toString());
      debugPrintStack(label: s.toString());
    }
  }
}
