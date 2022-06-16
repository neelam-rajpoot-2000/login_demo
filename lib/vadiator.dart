class ValidatorEmail{
  static final RegExp _emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  static String? validateEmailAddress(String email) {
    final _hasMatched = _emailRegex.hasMatch(email);
    if (!_hasMatched) {
      return 'Please enter a valid Email ID';
    } else {
      return null;
    }
  }


}

class  ValidatorPassword{
  static RegExp passwordRegex =
  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  static String? validatePassword(String password) {
    final _hasMatched = passwordRegex.hasMatch(password);
    if (password.length < 10) {
      return 'password should be 10 characters';
    }else
    if (!_hasMatched) {
      return 'Please enter a valid password';
    }else {
        return null;
      }
    }
  }

class  ValidatorPhone{
  static RegExp phoneRegex =
  RegExp (r'(^[7-9][0-9]{9}$)');
  static String? validatePhone(String phone){
    print(phone);
    final _hasMatched = phoneRegex.hasMatch(phone);
    print(_hasMatched);
      if (!_hasMatched) {

        return 'Please enter valid mobile number';
      }
      else {
        return null;
      }
  }
  }




