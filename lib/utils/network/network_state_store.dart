import 'package:locallense/values/enumeration.dart';
import 'package:mobx/mobx.dart';

part 'network_state_store.g.dart';

class NetworkStateStore = _NetworkStateStore with _$NetworkStateStore;

abstract class _NetworkStateStore with Store {
  @observable
  NetworkState state = NetworkState.idle;

  @observable
  String? error;
}
