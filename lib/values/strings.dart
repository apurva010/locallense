class AppRoutes {
  const AppRoutes._();

  static const String forwardSlash = '/';
  static const String homeScreen = '/homeScreen';
  static const String loginScreen = '/loginScreen';
  static const String basicDetailsScreen = '/basicDetailsScreen';
  static const String userActivityUpload = '/userActivityUpload';

  static const String selectPreference = '/selectPreference';
  static const String selectAccommodationType = '/selectAccommodationType';
  static const String questionnaireFlowScreen = '/questionnaireFlowScreen';
}

class ApiErrorStrings {
  const ApiErrorStrings._();

  static const String noInternetMsg = 'No internet connection.';
  static const String somethingWrongErrorMsg =
      'Something went wrong! Please try after some time.';
}
