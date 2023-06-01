import 'package:flutter/material.dart';
import 'package:besafe/helper/helper_function.dart';
import 'package:besafe/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bcrypt/bcrypt.dart';
class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;


 
  // login
  Future loginWithUserNameandPassword(String email, String password) async {

     final String passwordHashed = BCrypt.hashpw(
      'password',
      BCrypt.gensalt(),
    );
    

    try {
      
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // register
  Future registerUserWithEmailandPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        // call our database service to update the user data.
        await DatabaseService(uid: user.uid).savingUserData(fullName, email, password);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // signout
  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailSF("");
      await HelperFunctions.saveUserNameSF("");
     await HelperFunctions.saveUserPasswordSF("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
