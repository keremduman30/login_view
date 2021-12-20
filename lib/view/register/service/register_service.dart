// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_guide_examples/core/constant/enum/local_keys.dart';
import 'package:flutter_guide_examples/core/init/cache/local_manager.dart';
import 'package:flutter_guide_examples/view/register/model/user_model.dart';
import 'package:get/get.dart';

class RegisterService {
  late String errorMesage;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserModel?> userCreate(String name, String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        LocaleManager.instance.setStringValue(LocalKeysPreferencesKeys.id, userCredential.user!.uid);
        return kullaniciOlustur(userCredential.user);
      }
      return null;
    } on FirebaseAuthException catch (e) {
      viewException(e.code);
      return null;
    }
  }

  Future registerUserFirestore(String id, Map<String, dynamic> data) async {
    await _firebaseFirestore.collection("users").doc(id).set(data);
  }

  void viewException(hatacodu) {
    if (hatacodu == "email-already-in-use") {
      errorMesage = "boyle bir kullanıcı zaten var";
    }
    Get.snackbar("Uyarı", errorMesage);
  }

  UserModel? kullaniciOlustur(User? firebaseUser) {
    if (firebaseUser != null) {
      return UserModel.fromFirebaseAut(firebaseUser);
    } else {
      return null;
    }
  }
}
