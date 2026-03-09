import 'subscription_status.dart';

class FeatureAccess {
  const FeatureAccess({required this.featureKey, required this.allowed, this.reason});

  final String featureKey;
  final bool allowed;
  final String? reason;

  static FeatureAccess fromStatus(String key, SubscriptionStatus status) {
    final allowed = status == SubscriptionStatus.active || status == SubscriptionStatus.trial;
    return FeatureAccess(
      featureKey: key,
      allowed: allowed,
      reason: allowed ? null : 'Premium subscription required',
    );
  }
}
