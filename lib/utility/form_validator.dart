String? validateNotBlank(String? value) {
  return value == null || value.isEmpty ? "Please enter your details!" : null;
}

String? validatePassword(String? value) {
  final notBlank = validateNotBlank(value);

  if (notBlank != null) {
    return notBlank;
  } else if (value!.length < 6) {
    return "Password length must be at least 6 characters!";
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
  final notBlank = validateNotBlank(value);

  if (notBlank != null) {
    return notBlank;
  }

  final regex = RegExp(r'(\w)+@(\w)+((\.\w+)+)?');
  final matches = regex.allMatches(value!);

  if (matches.length != 1) {
    return "Please enter your email correctly!";
  } else {
    return null;
  }
}

String? validatePhoneNumber(String? value) {
  final notBlank = validateNotBlank(value);

  if (notBlank != null) {
    return notBlank;
  }

  final regex = RegExp(r'^(\+\d{2}-\d{2}|\d{3})-(\d{4})-(\d{4})$');
  final matches = regex.allMatches(value!);

  if (matches.length != 1) {
    return "Please enter your phone number correctly!";
  } else {
    return null;
  }
}
