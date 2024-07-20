class AppSession {
  AppSession._();

  static final AppSession instance = AppSession._();

  bool isInsideApp = false;
}
