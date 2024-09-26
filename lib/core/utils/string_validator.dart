class StringValidator {
  static const String _emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static final RegExp nameRegexp = RegExp(r"^([A-Za-z0-9]+)$");

  static bool validateEmail({required String email}) {
    var regExp = RegExp(_emailPattern);
    return regExp.hasMatch(email);
  }

  static String? validatePassword({String? password}) {
    if (password?.isEmpty ?? true) {
      return "Введите пароль";
    }
    if (!RegExp(r'(?=.*?[0-9])').hasMatch(password!)) {
      return "Минимум 1 цифра";
    }
    if (!RegExp(r"(?=.*?[!'" + r'#$%&()*+,-./:;<=>?@[\]^_`{|}~])')
        .hasMatch(password)) {
      return "Минимум 1 специальный символ";
    }
    if (password.length < 12) {
      return "Минимум 12 символов";
    }
    if (password.length > 50) {
      return 'Максимум 50 символов';
    }
    if (password.toUpperCase() == password ||
        password.toLowerCase() == password) {
      return 'Буквы верхнего и нижнего регистра';
    }
    return null;
  }

  static bool validateUserName({required String userName}) {
    return nameRegexp.hasMatch(userName);
  }
}
