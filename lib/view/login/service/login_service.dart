import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginService {
  late String errorMesage;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<bool?> signInLogin(String email, String password) async {
    try {
      UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      viewException(e.code);
      return false;
    }
  }

  void viewException(hatacodu) {
    if (hatacodu == "invalid-email") {
      errorMesage = "geçersiz mail";
    } else if (hatacodu == "user-disabled") {
      errorMesage = "kullanıcı engellenmis";
    } else if (hatacodu == "user-not-found") {
      errorMesage = "boyle bir kullanıcıı bulunamadı";
    } else if (hatacodu == "wrong-password") {
      errorMesage = "hatalı parola";
    }
    //
    Get.snackbar("Uyarı", errorMesage);
  }
}
