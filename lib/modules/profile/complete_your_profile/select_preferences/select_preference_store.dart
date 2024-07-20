import 'package:locallense/model/preference_dm/preference_dm.dart';
import 'package:mobx/mobx.dart';

part 'select_preference_store.g.dart';

class SelectPreferenceStore = _SelectPreferenceStore
    with _$SelectPreferenceStore;

abstract class _SelectPreferenceStore with Store {
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
  ];

  void selectPreference(int index) {
    final preference = preferenceList.elementAt(index);
    preference.value.isSelected = !preference.value.isSelected;
    preference.reportChanged();
  }
}
