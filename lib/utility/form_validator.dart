String? validateNotBlank(String? value) {
  return value == null || value.isEmpty ? "내용을 입력해 주세요!" : null;
}

String? validatePassword(String? value) {
  final notBlank = validateNotBlank(value);

  if (notBlank != null) {
    return notBlank;
  } else if (value!.length < 6) {
    return "패스워드 길이가 최소 6자 이상 되어야 합니다!";
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
    return "이메일을 정확하게 입력해 주세요!";
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
    return "전화번호를 정확하게 입력해 주세요!";
  } else {
    return null;
  }
}
