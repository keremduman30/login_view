import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": {
          "login": "Login",
          "email": "email",
          "password": "password",
          "remember": "Remember me",
          "forget_password": "forget password",
          "dont_have_account": "Dont have a account?",
          "create_app": "Create Account Now",
          "or":"OR"
        },
        "tr": {
          "login": "Giriş Yap",
          "email": "email",
          "password": "Parola",
          "remember": "Beni Hatırla",
          "forget_password": "parolamı unuttum",
          "dont_have_account": "Hesabınız yok mu ?",
          "create_app": "Yeni Hesap Olustur",
          "or":"YA DA",
        }
      };
}
