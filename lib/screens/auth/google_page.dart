// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// final GoogleSignIn googleSignIn = GoogleSignIn();

// Future<UserCredential?> signInWithGoogle() async {
//   try {
//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

//     if (googleUser != null) {
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;

//       final OAuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       final UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);
//       return userCredential;
//     }
//   } catch (e) {
//     print("Error signing in with Google: $e");
//   }

//   return null;
// }

// Future<void> signInWithFacebook() async {
//   final LoginResult loginResult = await FacebookAuth.instance.login();

//   if (loginResult.status == LoginStatus.success) {
//     final OAuthCredential facebookAuthCredential =
//         FacebookAuthProvider.credential(loginResult.accessToken!.token);

//     final UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

//     final User? user = userCredential.user;

//     if (user != null) {
//       // Успешная аутентификация
//       print("User successfully signed in with Facebook: ${user.uid}");
//     }
//   } else if (loginResult.status == LoginStatus.cancelled) {
//     // Отмена аутентификации в Facebook
//     print("Facebook login cancelled");
//   } else {
//     // Ошибка во время аутентификации в Facebook
//     print("Error signing in with Facebook: ${loginResult.message}");
//   }
// }

// class SignInPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign In'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: signInWithGoogle,
//               child: Text('Sign in with Google'),
//             ),
//             ElevatedButton(
//               onPressed: signInWithFacebook,
//               child: Text('Sign in with Facebook'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
