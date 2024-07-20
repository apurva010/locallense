import 'package:mobx/mobx.dart';

part 'dialog_store.g.dart';

class DialogStore = _DialogStore with _$DialogStore;

abstract class _DialogStore with Store {
  @observable
  bool isLoading = false;
}
