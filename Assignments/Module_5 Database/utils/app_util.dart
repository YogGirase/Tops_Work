class AppUtil {
  static final _nameRegex = RegExp(r'^[A-Za-z]+$');
  static final _emailRegex =
      RegExp(r'^[A-Za-z0-9._-]+@[A-Za-z]+\.[A-Za-z]{2,}$');
  static final _passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$');

  static String? validateName(String name) {
    if (name.isEmpty) {
      return 'Can\'t be empty';
    } else if (!_nameRegex.hasMatch(name)) {
      return 'Alphabets only';
    }
    return null;
  }

  static String? validateEmail(email) {
    if (email.isEmpty) {
      return 'Can\'t be empty';
    } else if (!_emailRegex.hasMatch(email)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validateContact(contact) {
    if (contact.isEmpty) {
      return 'Can\'t be empty';
    } else if (contact.toString().length != 10) {
      return 'Invalid contact';
    }
    return null;
  }

  static String? validatePassword(password) {
    if (password.isEmpty) {
      return 'Can\'t be empty';
    } else if (!_passwordRegex.hasMatch(password)) {
      return 'Invalid password';
    }
    return null;
  }

  static String? validateCpassword(String password, String cpassword) {
    if (cpassword != password) {
      return 'Password mismatch';
    }
    return null;
  }

  static String? validateEducation(String? education) {
    if (education == null || education.isEmpty) {
      return 'Please Select education';
    }
    return null;
  }
}
