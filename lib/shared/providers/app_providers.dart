import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/account/application/account_controller.dart';
import '../../features/auth/application/auth_controller.dart';
import '../../features/auth/data/firebase_auth_repository.dart';
import '../../features/auth/domain/auth_repository.dart';
import '../../features/subscription/application/subscription_controller.dart';
import '../../features/subscription/data/subscription_repository_impl.dart';
import '../../features/subscription/data/subscription_service.dart';
import '../../features/subscription/domain/subscription_repository.dart';

final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);
final dioProvider = Provider((ref) => Dio());
final secureStorageProvider = Provider((ref) => const FlutterSecureStorage());

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return FirebaseAuthRepository(ref.watch(firebaseAuthProvider));
});

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(ref.watch(authRepositoryProvider));
});

final subscriptionRepositoryProvider = Provider<SubscriptionRepository>((ref) {
  return SubscriptionRepositoryImpl(
    SubscriptionService(ref.watch(dioProvider), ref.watch(secureStorageProvider)),
  );
});

final subscriptionControllerProvider =
    StateNotifierProvider<SubscriptionController, SubscriptionState>((ref) {
  return SubscriptionController(ref.watch(subscriptionRepositoryProvider));
});

final accountControllerProvider = StateNotifierProvider<AccountController, AccountState>((ref) {
  return AccountController();
});
