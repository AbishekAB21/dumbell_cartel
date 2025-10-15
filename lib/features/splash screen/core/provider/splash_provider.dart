import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Synchronous provider to check if user is logged in
final splashAuthProvider = Provider<bool>((ref) {
  return FirebaseAuth.instance.currentUser != null;
});
