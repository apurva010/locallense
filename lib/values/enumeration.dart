enum NetworkState {
  idle,
  loading,
  success,
  error;

  bool get isIdle => this == NetworkState.idle;

  bool get isLoading => this == NetworkState.loading;

  bool get isSuccessful => this == NetworkState.success;

  bool get isFailed => this == NetworkState.error;
}

enum SharedPrefsKeys { isLoggedIn, userData }

enum SecureStorageKeys { kAccessToken }

enum ButtonType {
  primaryButton,
  secondaryButton,
  textOnly;

  bool get isPrimaryBtn => this == ButtonType.primaryButton;
}

enum SnackBarType {
  success,
  error;
}
