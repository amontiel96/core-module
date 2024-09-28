
class TDSMSlotPassValModel {
  final String id;
  final String label;
  int state;

  TDSMSlotPassValModel(this.id, this.label, this.state);

  // Método para convertir el objeto a un mapa (json)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'state': state,
    };
  }


}

class PasswordPinValidations  {
  final List<TDSMSlotPassValModel> rules;
  PasswordPinValidations(this.rules);
  
  //PIN validation: must be 4 characters

  // Método para convertir una lista de TDSMSlotPassValModel a una lista de json
  List<Map<String, dynamic>> convertListToJson(List<TDSMSlotPassValModel> list) {
    return list.map((item) => item.toJson()).toList();
  }

  int mustBeFourCharacters(String value) {
    int index =
        rules.indexWhere(((element) => element.id == 'CHARACTER_LENGTH'));
    if (value.isEmpty) {
      return rules[index].state = 1;
    } else if (value.length == 4) {
      return rules[index].state = 2;
    } else {
      return rules[index].state = 3;
    }
  }

  //PIN validation: must not have sequentials numbers
  int nonSequentialNumber(String value) {
    Map<String, dynamic> patterns = {};
    String inc = (patterns['increment'] ?? '01234567890123456789').toString();
    String dec = (patterns['decrement'] ?? '98765432109876543210').toString();
    int index =
        rules.indexWhere(((element) => element.id == 'NON_SEQUENTIAL_NUM'));
    if (value.isEmpty) {
      return rules[index].state = 1;
    } else if (!inc.contains(value) && !dec.contains(value)) {
      return rules[index].state = 2;
    } else {
      return rules[index].state = 3;
    }
  }

  //PIN validation: must not have repetive numbers

  int nonRepetiveNumber(String value) {
    int index =
        rules.indexWhere(((element) => element.id == 'NON_REPETIVE_NUM'));
    if (value.isEmpty) {
      return rules[index].state = 1;
    } else if (!RegExp(r'(^|(.)(?!\2))(\d)\3{3}(?!\3)').hasMatch(value)) {
      return rules[index].state = 2;
    } else {
      return rules[index].state = 3;
    }
  }

  // check if password length is between 8 to 16 characters

  int between8and16(String value) {
    int index = rules.indexWhere(((element) => element.id == 'LIM_LETTERS'));
    if (value.isEmpty) {
      return rules[index].state = 1;
    } else if (value.isNotEmpty &&
        value.length >= 8 &&
        value.length <= 16 &&
        !value.contains(' ')) {
      return rules[index].state = 2;
    } else {
      return rules[index].state = 3;
    }
  }

// checks if passwords contains at least one lowercase character

  int atLeastOneLowerCase(String value) {
    int index =
        rules.indexWhere(((element) => element.id == 'LOWERCASE_LETTER'));
    if (value.isEmpty) {
      return rules[index].state = 1;
    } else if (RegExp(r'.*[a-z].*').hasMatch(value)) {
      return rules[index].state = 2;
    } else {
      return rules[index].state = 3;
    }
  }

// checks if passwords contains at least one uppercase character

  int atLeastOneUpperCase(String value) {
    int index =
        rules.indexWhere(((element) => element.id == 'UPPERCASE_LETTER'));
    if (value.isEmpty) {
      return rules[index].state = 1;
    } else if (RegExp(r'.*[A-Z].*').hasMatch(value)) {
      return rules[index].state = 2;
    } else {
      return rules[index].state = 3;
    }
  }

// checks if passwords contains at least one number or alphanumeric character
  int atLeastOneNumOrAlphaNum(String value) {
    //[Check if it contains at least one digit]
    bool hasDigit = RegExp(r'.*\d.*').hasMatch(value);

    //[Checks combinations of alphanumeric and non-alphanumeric characters]
    bool hasAlphaNumNonAlphaNum =
        RegExp(r'([^a-zA-Z\d])+([a-zA-Z\d])+|([a-zA-Z\d])+([^a-zA-Z\d])+')
            .hasMatch(value);

    //[Check if it contains Ñ, ñ, or any letter with an accent]
    bool hasInvalidChars = RegExp(r'[ÑñáéíóúÁÉÍÓÚ]').hasMatch(value);
    int index = rules.indexWhere(((element) => element.id == 'NUM_SYM_LETTER'));
    if (value.isEmpty) {
      return rules[index].state = 1;
    } else if (!hasInvalidChars && (hasAlphaNumNonAlphaNum || hasDigit)) {
      return rules[index].state = 2;
    } else {
      return rules[index].state = 3;
    }
  }

  //checks which rules its going to validate

  bool validateRules({
    required bool ffPassword,
    required String value,
    String? birthdate,
    String? countryCode,
    bool fromSimplified = false,
  }) {
    if (!ffPassword) {
      int atLeastOneUpperCaseVal = atLeastOneUpperCase(value);
      int between8and16Val = between8and16(value);
      int atLeastOneLowerCaseVal = atLeastOneLowerCase(value);
      int tLeastOneNumOrAlphVal = atLeastOneNumOrAlphaNum(value);
      if (atLeastOneUpperCaseVal == 2 &&
          between8and16Val == 2 &&
          atLeastOneLowerCaseVal == 2 &&
          tLeastOneNumOrAlphVal == 2) {
        return true;
      }
      return false;
    } else {
      int mustBeFourCharactersVal = mustBeFourCharacters(value);
      int nonSequentialNumberVal = nonSequentialNumber(value);
      int nonRepetiveNumberVal = nonRepetiveNumber(value);
      List<String> allowedCountryCodes = ['py'];
      if (!allowedCountryCodes.contains(countryCode)) {
        if (mustBeFourCharactersVal == 2 &&
            nonSequentialNumberVal == 2 &&
            nonRepetiveNumberVal == 2) {
          return true;
        }
      } else {
        if (mustBeFourCharactersVal == 2 &&
            nonSequentialNumberVal == 2 &&
            nonRepetiveNumberVal == 2) {
          return true;
        }
      }

      return false;
    }
  }
}
