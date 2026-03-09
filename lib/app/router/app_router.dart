import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/account/presentation/account_page.dart';
import '../../features/auth/presentation/forgot_password_page.dart';
import '../../features/auth/presentation/login_page.dart';
import '../../features/auth/presentation/signup_page.dart';
import '../../features/dashboard/presentation/dashboard_page.dart';
import '../../features/landing/presentation/landing_page.dart';
import '../../features/nutrition/presentation/nutrition_page.dart';
import '../../features/religion/presentation/religion_page.dart';
import '../../features/relationships/presentation/relationships_page.dart';
import '../../features/sport/presentation/sport_page.dart';
import '../../features/subscription/presentation/manage_subscription_page.dart';
import '../../features/subscription/presentation/paywall_page.dart';
import '../../shared/providers/app_providers.dart';
import '../constants/app_routes.dart';
import '../core/guards/route_guard.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(authControllerProvider);
  final sub = ref.watch(subscriptionControllerProvider);

  return GoRouter(
    initialLocation: AppRoutes.landing,
    redirect: (_, state) => redirectGuard(location: state.matchedLocation, auth: auth, subscription: sub),
    routes: [
      GoRoute(path: AppRoutes.landing, builder: (_, __) => const LandingPage()),
      GoRoute(path: AppRoutes.signup, builder: (_, __) => const SignupPage()),
      GoRoute(path: AppRoutes.login, builder: (_, __) => const LoginPage()),
      GoRoute(path: AppRoutes.forgotPassword, builder: (_, __) => const ForgotPasswordPage()),
      GoRoute(path: AppRoutes.paywall, builder: (_, __) => const PaywallPage()),
      GoRoute(path: AppRoutes.manageSubscription, builder: (_, __) => const ManageSubscriptionPage()),
      GoRoute(path: AppRoutes.account, builder: (_, __) => const AccountPage()),
      GoRoute(path: AppRoutes.dashboard, builder: (_, __) => const DashboardPage()),
      GoRoute(path: AppRoutes.sport, builder: (_, __) => const SportPage()),
      GoRoute(path: AppRoutes.nutrition, builder: (_, __) => const NutritionPage()),
      GoRoute(path: AppRoutes.relationships, builder: (_, __) => const RelationshipsPage()),
      GoRoute(path: AppRoutes.religion, builder: (_, __) => const ReligionPage()),
    ],
  );
});
