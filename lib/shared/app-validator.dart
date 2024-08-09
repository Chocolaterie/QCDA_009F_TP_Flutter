import 'package:email_validator/email_validator.dart';

class AppValidator {

  /// Validateur d'email
  static String? emailValidator(String? value){
    // Si pas ull
    if (value == null){
      return "L'email ne doit pas être vide";
    }

    // Tester si format email à l'aide d'une lib
    if (!EmailValidator.validate(value!)){
      return "Le format de l'email est incorrect";
    }

    return null;
  }
}