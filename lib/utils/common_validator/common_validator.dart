import 'package:locallense/utils/extensions.dart';
import 'package:locallense/values/constants.dart';
import 'package:screwdriver/screwdriver.dart';

class CommonValidator {
  static String? emailValidator(String? value) {
    if (value.isNullOrBlank ||
        !value!.isValidEmail ||
        value.length < Constants.emailMinLength) {
      return 'Please enter valid email address';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value.isNullOrBlank) {
      return 'Please enter name';
    }
    return null;
  }

  static String? dateOfBirthValidator(String? value) {
    if (value.isNullOrBlank) {
      return 'Please enter date of birth';
    }
    return null;
  }
}
