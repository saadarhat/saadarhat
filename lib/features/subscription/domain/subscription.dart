import '../../../shared/models/subscription_status.dart';
import '../../../shared/models/user_plan.dart';

class Subscription {
  const Subscription({
    required this.status,
    required this.plan,
    this.expiresAt,
  });

  final SubscriptionStatus status;
  final UserPlan plan;
  final DateTime? expiresAt;

  bool get isActive => status == SubscriptionStatus.active || status == SubscriptionStatus.trial;
}
