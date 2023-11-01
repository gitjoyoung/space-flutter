<<<<<<< HEAD
class EmailValidator {
  static bool isValid(String email) {
    final RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    );
    return regex.hasMatch(email);
  }
}
=======
class EmailValidator {
  static bool isValid(String email) {
    final RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    );
    return regex.hasMatch(email);
  }
}
>>>>>>> 3604355999b0dfcc6f6d3eec4ca86d64343f07c0
