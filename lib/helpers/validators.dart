class Validator {
  static bool isNullOrEmpty(String? value) {
    return (value ?? '').isEmpty;
  }

  static String? nullOrEmptyValidation(String? value, String message) {
    return (value ?? '').isEmpty ? message : null;
  }

  static String? emailValidation(String? value) {
    if (value == null) {
      return "Please enter a valid email";
    }
    final RegExp rgx = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return rgx.hasMatch(value) ? null : "Please enter a valid email";
  }

  static String? passwordValidation(String? value) {
    if (Validator.isNullOrEmpty(value)) {
      return "Please enter password";
    }
    if ((value?.length ?? 0) <= 5) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  static String? confirmPasswordValidation(String? value, String? password) {
    if (Validator.isNullOrEmpty(value)) {
      return "Please enter password";
    }

    if (value != password) {
      return "Password is not match";
    }
    return null;
  }
}
