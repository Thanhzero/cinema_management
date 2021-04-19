import 'package:flutter_cinema/common/constants/string_constants.dart';

class Validate {
  static String _validatePhone = r'0\d{8,}';
  static RegExp _expPhoneNumber = RegExp(_validatePhone);

  static String validateFullName(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.errorInvalidFullName;
    }
    return null;
  }

  static String validatePhoneNumber(String value) {
    if (value == null ||
        value.isEmpty ||
        !_expPhoneNumber.hasMatch(value) ||
        value.length > 10) {
      return StringConstants.errorInvalidPhoneNumber;
    }
    return null;
  }

  static String validatePassword(String value) {
    if (value.isEmpty || value.length < 6) {
      return StringConstants.errorInvalidPassword;
    }
    return null;
  }

  static String validateNewPassword(String oldPassword, String newPassword) {
    if (oldPassword.isEmpty) {
      return null;
    }
    if (newPassword.isEmpty || newPassword.length < 6) {
      return StringConstants.errorInvalidPassword;
    }
    if (oldPassword == newPassword) {
      return StringConstants.duplicatePassword;
    }
    return null;
  }

  static String validateConfirmPassword(
      String oldPassword, String newPassword, String confirmPassword) {
    if (oldPassword.isEmpty) {
      return null;
    }
    if (newPassword != confirmPassword) {
      return StringConstants.confirmPasswordInvalid;
    }
    return null;
  }

  static String validateTeamName(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.invalidTeamName;
    }
    return null;
  }

  static String validateSelectedTeamName(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.invalidSelectedTeamName;
    }
    return null;
  }

  static String validateTeamType(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.invalidTeamType;
    }
    return null;
  }

  static String validateLocation(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.invalidLocation;
    }
    return null;
  }

  static String validateLevel(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.invalidTeamLevel;
    }
    return null;
  }

  static String validateTeamSizeType(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.invalidTeamSizeType;
    }
    return null;
  }

  static String validateNumberOnJersey(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.invalidNumberOnJersey;
    }
    return null;
  }

  static String validateNameOnJersey(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.invalidiNameOnJersey;
    }
    return null;
  }

  static String validateBirthDay(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.enterDateOfBirth;
    }
    return null;
  }

  static String validateGender(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.enterGender;
    }
    return null;
  }

  static String validatePosition(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.enterPosition;
    }
    return null;
  }

    static String validateWeight(String value) {
    RegExp validWeight = RegExp(r'^\d+(,|.)?\d{1,2}\s?kg$');
    if (!validWeight.hasMatch(value)) {
      return StringConstants.enterWeight;
    }
    return null;
  }

  static String validateHeight(double value) {
    if (value == null || value <= 0) {
      return StringConstants.enterHeight;
    }
    return null;
  }

  static String validateDominantFoot(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.enterDominantFoot;
    }
    return null;
  }

  static String validateTitle(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.invalidTitle;
    }
    return null;
  }

  static String validateTime(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.invalidTime;
    }
    return null;
  }
  static String validateEmpty(String value) {
    if (value == null || value.isEmpty) {
      return '';
    }
    return null;
  }

  static String validateActiveTime(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.enterActiveTime;
    }
    return null;
  }

  static bool validateUrl(String url) {
    return Uri.parse(url).isAbsolute;
  }

  static String validatePaymentType(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.enterPaymentType;
    }
    return null;
  }

  static String validateAmount(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.enterAmount;
    }
    return null;
  }

  static String validateDate(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.enterDate;
    }
    return null;
  }

  static String validateSponsor(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.enterSponsor;
    }
    return null;
  }

  static String validatePlayer(String value) {
    if (value == null || value.isEmpty) {
      return StringConstants.enterPlayer;
    }
    return null;
  }
}
