import '../../../shared/models/app_user.dart';

abstract class AuthRepository {
  Stream<AppUser?> watchAuthState();
  Future<AppUser> signUp({required String fullName, required String email, required String password});
  Future<AppUser> signIn({required String email, required String password});
  Future<void> sendPasswordReset(String email);
  Future<void> signOut();
}
