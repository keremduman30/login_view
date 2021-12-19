// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_guide_examples/view/register/model/user_model.dart';
import 'package:get/get.dart';

class RegisterService {
  late String errorMesage;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<bool?> userCreate(String name, String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        _firebaseFirestore.collection("users").doc(userCredential.user!.uid).set({
          "userId": userCredential.user?.uid,
          "userName": name,
          "mail": userCredential.user?.email,
          "profilFoto": userCredential.user?.photoURL,
        });
      }

      return true;
    } on FirebaseAuthException catch (e) {
      viewException(e.code);
      return false;
    }
  }

  void viewException(hatacodu) {
    if (hatacodu == "email-already-in-use") {
      errorMesage = "boyle bir kullanıcı zaten var";
    }
    Get.snackbar("Uyarı", errorMesage);
  }
}
