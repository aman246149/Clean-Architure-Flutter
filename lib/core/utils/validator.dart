class Validator {
  static String? validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validatePasswordAndConfirmPassword(
      String password, String confirmPassword) {
    if (password.isEmpty || confirmPassword.isEmpty) {
      return 'Please enter a password and confirm it';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

    static String? validateName(String value) {
    if (value.isEmpty) {
      return 'Please enter a name';
    }
  
    return null;
  }
    static String? validateDescription(String value) {
    if (value.isEmpty) {
      return 'Please enter a Description';
    }
  
    return null;
  }

    static String? validateMobileNumber(String value) {
    if (value.isEmpty) {
      return 'Please enter a mobileNumer';
    }
    if (value.length < 6) {
      return 'Please enter a valid mobileNumber';
    }
    return null;
  }


}
