// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? userID;
  final String? userName;
  final String? mail;
  final String? profilFoto;

  UserModel({required this.userID, required this.userName, required this.mail, required this.profilFoto});

  factory UserModel.fromFirebaseAut(User firebase_user) {
    return UserModel(
      userID: firebase_user.uid,
      userName: firebase_user.displayName,
      mail: firebase_user.email,
      profilFoto: firebase_user.photoURL,
    );
  }

  factory UserModel.fromFirestoreDocumentSnaphot(DocumentSnapshot<Map<String, dynamic>> docSnap) {
    // final doc=docSnap!.data();
    return UserModel(
      userID: docSnap.data()!['userID']!,
      userName: docSnap.data()!["userName"]!,
      mail: docSnap.data()!["mail"]!,
      profilFoto: docSnap.data()!["profilFoto"]!,
    );
  }
  Map<String,dynamic> toJson(User user){
    Map<String,dynamic> users=Map();
    users["userId"]=user.uid;
    users["userName"]=user.displayName;
    users["mail"]=user.email;
    users["profilFoto"]=user.photoURL;
    return users;

  }
}














/* // ignore_for_file: prefer_collection_literals, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? userID;
  final String? userName;
  final String? mail;
  final String? profilFoto;

  UserModel({required this.userID, required this.userName, required this.mail, required this.profilFoto});

  factory UserModel.fromFirebaseAut(User firebase_user) {
    return UserModel(userID: firebase_user.uid, userName: firebase_user.displayName, mail: firebase_user.email, profilFoto: firebase_user.photoURL);
  }

  factory UserModel.fromFirestoreDocumentSnaphot(DocumentSnapshot? docSnap) {
    // final doc=docSnap!.data();
    return UserModel(
      userID: docSnap!.data()!['userID'],
      userName: docSnap.data()!["userName"]!,
      mail: docSnap.data()!["mail"]!,
      profilFoto: docSnap.data()!["profilFoto"]!,
    );
  }

}
 */