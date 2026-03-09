import 'package:firebase_auth/firebase_auth.dart';

import '../../../shared/models/app_user.dart';
import '../domain/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  FirebaseAuthRepository(this._auth);

  final FirebaseAuth _auth;

  @override
  Stream<AppUser?> watchAuthState() => _auth.authStateChanges().map((user) {
        if (user == null) return null;
        return AppUser(id: user.uid, fullName: user.displayName ?? '', email: user.email ?? '');
      });

  @override
  Future<AppUser> signIn({required String email, required String password}) async {
    final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
    final user = cred.user!;
    return AppUser(id: user.uid, fullName: user.displayName ?? '', email: user.email ?? email);
  }

  @override
  Future<AppUser> signUp({required String fullName, required String email, required String password}) async {
    final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    await cred.user?.updateDisplayName(fullName);
    return AppUser(id: cred.user!.uid, fullName: fullName, email: email);
  }

  @override
  Future<void> sendPasswordReset(String email) => _auth.sendPasswordResetEmail(email: email);

  @override
  Future<void> signOut() => _auth.signOut();
}
