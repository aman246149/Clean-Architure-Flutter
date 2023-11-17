import 'package:architecture/core/utils/common_methods.dart';
import 'package:flutter/services.dart';

class Validator {

    static bool checkCommonEmail(String emailToCheck){
      if (commonEmailDomains.contains(emailToCheck.split('@')[1])) {
    print('Email domain is in the common list.');
    return true;
  } else {
    print('Email domain is not in the common list.');
    return false;
  }
  }
  
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
  if (!value.contains( RegExp(r'[A-Z]'))) {
    return 'Password must contain at least one capital letter';
  }
  if (!value.contains( RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
    return 'Password must contain at least one special character';
  }
  // Add other criteria to make the password strong here.
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

  static String? isEmptyCheckValidator(String value) {
    if (value.isEmpty) {
      return 'Field Cannot be Empty';
    }

    return null;
  }

  static String? validateDescription(String value) {
    if (value.isEmpty) {
      return 'Please enter a Description';
    }

    return null;
  }

  static String? validateQuestions(String value) {
    if (value.isEmpty) {
      return 'Required field';
    }

    return null;
  }

  static String? validateMobileNumber(String value) {
    if (value.isEmpty) {
      return 'Please enter a mobileNumer';
    }
    if (value.length < 9) {
      return 'Please enter a valid mobileNumber';
    }
    return null;
  }

  static String? validateCreditCardNumber(String? input) {
    if (input == null || input.isEmpty) {
      return "This field is required";
    }
    input = CardUtils.getCleanedNumber(input);
    if (input.length < 8) {
      return "Card is invalid";
    }
    int sum = 0;
    int length = input.length;
    for (var i = 0; i < length; i++) {
      // get digits in reverse order
      int digit = int.parse(input[length - i - 1]);
// every 2nd number multiply with 2
      if (i % 2 == 1) {
        digit *= 2;
      }
      sum += digit > 9 ? (digit - 9) : digit;
    }
    if (sum % 10 == 0) {
      return null;
    }
    return "Card is invalid";
  }

  static String? validateCVV(String value) {
    if (value.isEmpty) {
      return 'Please enter a CVV';
    }

    // Custom validation logic for CVV (example checks for 3 or 4 digits)
    if (value.length < 3 ||
        value.length > 4 ||
        !RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Invalid CVV';
    }

    return null;
  }

  static String? validateExpiryDate(String value) {
    if (value.isEmpty) {
      return 'Please enter an expiry date';
    }

    // Custom validation logic for expiry date (example checks for MM/YY format)
    if (!RegExp(r'^(0[1-9]|1[0-2])/\d{2}$').hasMatch(value)) {
      return 'Invalid expiry date format';
    }

    // You can add additional logic to check if the date is not expired

    return null;
  }
}

class CardUtils {
  static String getCleanedNumber(String text) {
    RegExp regExp = RegExp(r"[^0-9]");
    return text.replaceAll(regExp, '');
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }


}
