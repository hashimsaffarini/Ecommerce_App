String? validatePassword(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  if (regExp.hasMatch(value)) {
    return null;
  } else {
    return 'Password must contain at least 8 characters, including uppercase, lowercase, number, and special character';
  }
}

String? validateEmail(String value) {
  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regExp = RegExp(pattern);
  if (regExp.hasMatch(value)) {
    return null;
  } else {
    return 'Please enter a valid email';
  }
}
