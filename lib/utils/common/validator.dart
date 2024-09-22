class Validator {
  static String? emailValidator(String? value) {
    // Regular expression for validating email addresses
    // final RegExp emailRegExp = RegExp(
    //   r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    // );

    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    }
    return null; // Return null if validation passes
  }

  static String? passowrdValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    return null; // Return null if validation passes
  }

  static String? genderValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Gender cannot be empty';
    }
    return null; // Return null if validation passes
  }

  static String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null; // Return null if validation passes
  }
}
