import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpDb {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  // Creates User and saves credentials to firestore

  createUserWithEmailAndPassword(
    String username,
    String email,
    String password,
  ) async {
    try {
      // Create User
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;

      // Save credentials to firestore
      await _firestore.collection('users').doc(uid).set({
        "uid": uid,
        "username": username,
        "email": email,
        "createdAt": FieldValue.serverTimestamp(),
      });
    } catch (e) {
      throw Exception('Something went wrong');
    }
  }
}
