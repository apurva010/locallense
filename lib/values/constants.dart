class Constants {
  const Constants._();

  static const baseUrl = 'https://locallense.azurewebsites.net/';

  static const String empty = '';
  static const String forwardSlash = '/';
  static const String apiTokenKey = 'API_TOKEN_KEY';

  static const emailRegex =
      r"^(([^<>()[\]\.,;:\s@\']+(\.[^<>()[\]\.,;:\s@\']+)*)|(\'.+\'))@(([^<>()[\]\.,;:\s@\']+\.)+[^<>()[\]\.,;:\s@\']{2,})$";

  static const emailMinLength = 7;

  static const maxLengthOfName = 50;
  static const maxLengthOfEmail = 50;
}
