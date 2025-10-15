import 'package:firebase_auth/firebase_auth.dart';

class SignInDb {
  final _auth = FirebaseAuth.instance;

  // Sign in User
  signInUserWithEmailAndPassword(String email, String password) async {
    try {
      // Sign in user
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception('Could not sign in');
    }
  }
}
