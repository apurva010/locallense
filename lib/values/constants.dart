class Constants {
  const Constants._();

  static const baseUrl =
      'http://ec2-13-202-25-238.ap-south-1.compute.amazonaws.com:4000/';

  static const String empty = '';
  static const String forwardSlash = '/';
  static const String apiTokenKey = 'API_TOKEN_KEY';

  static const emailRegex =
      r"^(([^<>()[\]\.,;:\s@\']+(\.[^<>()[\]\.,;:\s@\']+)*)|(\'.+\'))@(([^<>()[\]\.,;:\s@\']+\.)+[^<>()[\]\.,;:\s@\']{2,})$";

  static const emailMinLength = 7;

  static const maxLengthOfName = 50;
  static const maxLengthOfEmail = 50;
}
