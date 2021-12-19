// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_guide_examples/core/constant/enum/local_keys.dart';
import 'package:flutter_guide_examples/core/constant/enum/local_keys_enum.dart';
import 'package:flutter_guide_examples/core/init/cache/local_manager.dart';

class  HomeServices {
   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

   Future<void> cikisYap()async{
    await _firebaseAuth.signOut();
    await LocaleManager.instance.setBoolValue(LocalKeysPreferencesKeys.login, false);
    

   }
  
}