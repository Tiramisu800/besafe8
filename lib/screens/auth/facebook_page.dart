// import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class FacebookLoginPage extends StatefulWidget {
//   const FacebookLoginPage({Key? key}) : super(key: key);

//   @override
//   _FacebookLoginPageState createState() => _FacebookLoginPageState();
// }

// class _FacebookLoginPageState extends State<FacebookLoginPage> {
//   Future<void> signInWithFacebook() async {
//     try {
//       final LoginResult loginResult = await FacebookAuth.instance.login();

//       if (loginResult.status == LoginStatus.success) {
//         final OAuthCredential facebookAuthCredential =
//             FacebookAuthProvider.credential(loginResult.accessToken!.token);

//         final UserCredential userCredential =
//             await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

//         final User? user = userCredential.user;

//         if (user != null) {
//           // Successful authentication
//           print("User successfully signed in with Facebook: ${user.uid}");
//         }
//       } else if (loginResult.status == LoginStatus.cancelled) {
//         // Facebook login cancelled
//         print("Facebook login cancelled");
//       } else {
//         // Error during Facebook login
//         print("Error signing in with Facebook: ${loginResult.message}");
//       }
//     } catch (e) {
//       // Error occurred
//       print("Error signing in with Facebook: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Facebook Login'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: signInWithFacebook,
//           child: const Text('Sign in with Facebook'),
//         ),
//       ),
//     );
//   }
// }
