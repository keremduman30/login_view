// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_guide_examples/core/constant/enum/local_keys.dart';
import 'package:flutter_guide_examples/core/constant/enum/local_keys_enum.dart';
import 'package:flutter_guide_examples/core/init/cache/local_manager.dart';
import 'package:flutter_guide_examples/view/register/model/user_model.dart';

class  HomeServices {
   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
   final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

   Future<void> cikisYap()async{
    await _firebaseAuth.signOut();
    await LocaleManager.instance.setBoolValue(LocalKeysPreferencesKeys.login, false);
    

   }
   Future getAllUsers()async{
    var snapshot=await  _firebaseFirestore.collection("users").get();
    if (snapshot.docs.isNotEmpty) {
     List<UserModel> users= snapshot.docs.map((doc) => UserModel.fromFirestoreDocumentSnaphot(doc)).toList();
     return users;
    }
    else{
      return [];
      
    }
   }
  
}