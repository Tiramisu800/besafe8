import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bcrypt/bcrypt.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  // saving the userdata
  Future savingUserData(String fullName, String email, String password) async {
    final String passwordHashed = BCrypt.hashpw(
      'password',
      BCrypt.gensalt(),
    );
    return await userCollection.doc(uid).set({
      "fullName": fullName,
      "email": email,
      "password": password,
      "hashedPassword": passwordHashed
    });
  }

  // getting user data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }
}
