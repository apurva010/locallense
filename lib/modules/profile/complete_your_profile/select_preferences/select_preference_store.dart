import 'package:locallense/apibase/repository/api_repository.dart';
import 'package:locallense/model/preference_dm/preference_dm.dart';
import 'package:locallense/model/response/preferences/preferences_res.dart';
import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/enumeration.dart';
import 'package:mobx/mobx.dart';
import 'package:screwdriver/screwdriver.dart';

part 'select_preference_store.g.dart';

class SelectPreferenceStore = _SelectPreferenceStore
    with _$SelectPreferenceStore;

abstract class _SelectPreferenceStore with Store {
  _SelectPreferenceStore(List<PreferencesRes> preSelectPreferences) {
    loadPreferences(preSelectPreferences);
  }

  @observable
  NetworkState screenState = NetworkState.idle;

  @observable
  List<Observable<PreferenceDm>> preferenceList = [
    Observable(
      PreferenceDm(
        preference: 'Food',
      ),
    ),
    Observable(
      PreferenceDm(
        preference: 'Gym',
      ),
    ),
    Observable(
      PreferenceDm(
        preference: 'Scenery',
      ),
    ),
    Observable(
      PreferenceDm(
        preference: 'Restaurant',
      ),
    ),
    Observable(
      PreferenceDm(
        preference: 'Sports',
      ),
    ),
    Observable(
      PreferenceDm(
        preference: 'Shopping',
      ),
    ),
    Observable(
      PreferenceDm(
        preference: 'Healthcare',
      ),
    ),
    Observable(
      PreferenceDm(
        preference: 'Cafe',
      ),
    ),
    Observable(
      PreferenceDm(
        preference: 'Parking Spot',
      ),
    ),
    Observable(
      PreferenceDm(
        preference: 'Outdoor activities',
      ),
    ),
    Observable(
      PreferenceDm(
        preference: 'Budget friendly',
      ),
    ),
    Observable(
      PreferenceDm(
        preference: 'Amusement park',
      ),
    ),
    Observable(
      PreferenceDm(
        preference: 'museum',
      ),
    ),
    Observable(
      PreferenceDm(
        preference: 'tourist attraction',
      ),
    ),
    Observable(
      PreferenceDm(
        preference: 'Family Health Center',
      ),
    ),
  ];

  void preSelectUserPreferences(List<PreferencesRes> preSelect) {
    for (final element in preSelect) {
      for (final value in preferenceList) {
        if (value.value.preference.capitalized ==
            element.preferenceName.capitalized) {
          value.value.isSelected = true;
          value.reportChanged();
          break;
        }
      }
    }
    screenState = NetworkState.success;
  }

  Future<void> loadPreferences(List<PreferencesRes> preSelect) async {
    screenState = NetworkState.loading;
    final resPreference =
        await APIRepository.instance.getPreferences().getResult();
    preferenceList = resPreference
        .map(
          (e) => Observable(
            PreferenceDm(
              preference: e.preferenceName,
            ),
          ),
        )
        .toList();
    preSelectUserPreferences(preSelect);
  }

  void selectPreference(int index) {
    final preference = preferenceList.elementAt(index);
    preference.value.isSelected = !preference.value.isSelected;
    preference.reportChanged();
  }
}
