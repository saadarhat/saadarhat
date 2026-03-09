import '../../../features/auth/application/auth_controller.dart';
import '../../../features/subscription/application/subscription_controller.dart';
import '../../constants/app_routes.dart';

String? redirectGuard({
  required String location,
  required AuthState auth,
  required SubscriptionState subscription,
}) {
  final isPublic = {
    AppRoutes.landing,
    AppRoutes.login,
    AppRoutes.signup,
    AppRoutes.forgotPassword,
  }.contains(location);

  if (!auth.isAuthenticated && !isPublic) return AppRoutes.login;

  final premiumRoutes = {
    AppRoutes.sport,
    AppRoutes.nutrition,
    AppRoutes.relationships,
    AppRoutes.religion,
  };

  if (auth.isAuthenticated && premiumRoutes.contains(location) && !subscription.hasPremium) {
    return AppRoutes.paywall;
  }
  return null;
}
