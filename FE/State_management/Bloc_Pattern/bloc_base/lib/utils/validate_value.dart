import 'package:bloc_base/utils/enum_validate.dart';

class ValidateValue {
  final EnumValidate enumValidate;
  const ValidateValue(this.enumValidate);

  validateUserName(String? value) {
    if (value == null || value == '') {
      return 'Username cannot be blank!';
    } else if (!RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value)) {
      return 'Username is not in correct format!';
    } else {
      return null;
    }
  }

  validatePassWord(String? value) {
    if (value!.isEmpty || value == '') {
      return 'Password cannot be blank!';
    } else if (value.length < 8) {
      return "Password must have 8 characters or more!";
    } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{7,20}')
        .hasMatch(value)) {
      return "Password is not in correct format!";
    } else {
      return null;
    }
  }

  validate(String? value) {
    switch (enumValidate) {
      case EnumValidate.USERNAME:
        return validateUserName(value);
      case EnumValidate.PASSWORD:
        return validatePassWord(value);
      default:
        return null;
    }
  }
}
