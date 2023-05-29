import 'package:besafe/helper/helper_function.dart';
import 'package:besafe/screens/auth/login_page.dart';
import 'package:besafe/views/login_screen.dart';
import 'package:besafe/service/auth_service.dart';
import 'package:besafe/service/database_service.dart';
import 'package:besafe/widgets/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookPage extends StatefulWidget {
  const FacebookPage({Key? key}) : super(key: key);

  @override
  State<FacebookPage> createState() => FacebookPage();
}

Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.token);

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}