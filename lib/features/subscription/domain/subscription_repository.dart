import 'subscription.dart';

abstract class SubscriptionRepository {
  Stream<Subscription> watchSubscription();
  Future<Subscription> refreshSubscription();
  Future<void> openCheckout();
  Future<void> openManageSubscription();
}
