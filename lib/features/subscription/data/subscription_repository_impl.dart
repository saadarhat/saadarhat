import '../../../shared/models/subscription_status.dart';
import '../../../shared/models/user_plan.dart';
import '../domain/subscription.dart';
import '../domain/subscription_repository.dart';
import 'subscription_service.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  SubscriptionRepositoryImpl(this._service);
  final SubscriptionService _service;

  @override
  Stream<Subscription> watchSubscription() async* {
    yield await refreshSubscription();
  }

  @override
  Future<Subscription> refreshSubscription() async {
    final data = await _service.fetchSubscription();
    return Subscription(
      status: SubscriptionStatus.values.byName((data['status'] as String?) ?? 'free'),
      plan: UserPlan.values.byName((data['plan'] as String?) ?? 'free'),
      expiresAt: DateTime.tryParse((data['expiresAt'] as String?) ?? ''),
    );
  }

  @override
  Future<void> openCheckout() => _service.createCheckoutSession();

  @override
  Future<void> openManageSubscription() => _service.openNativeSubscriptionManager();
}
