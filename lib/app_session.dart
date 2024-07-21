import 'package:locallense/modules/home/map/model/place_dm.dart';
import 'package:mobx/mobx.dart';

class AppSession {
  AppSession._();

  static final AppSession instance = AppSession._();

  bool isInsideApp = false;

  ObservableList<PlaceDm> places = ObservableList();
}
