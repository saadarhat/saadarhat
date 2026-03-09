import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/models/subscription_status.dart';
import '../../../shared/models/user_plan.dart';
import '../domain/subscription.dart';
import '../domain/subscription_repository.dart';

class SubscriptionState {
  const SubscriptionState({
    this.subscription = const Subscription(status: SubscriptionStatus.free, plan: UserPlan.free),
    this.loading = false,
  });

  final Subscription subscription;
  final bool loading;

  bool get hasPremium => subscription.isActive;
}

class SubscriptionController extends StateNotifier<SubscriptionState> {
  SubscriptionController(this._repository) : super(const SubscriptionState()) {
    _repository.watchSubscription().listen((s) => state = SubscriptionState(subscription: s));
  }

  final SubscriptionRepository _repository;

  Future<void> refresh() async {
    state = SubscriptionState(subscription: state.subscription, loading: true);
    final latest = await _repository.refreshSubscription();
    state = SubscriptionState(subscription: latest);
  }

  Future<void> checkout() => _repository.openCheckout();
  Future<void> manage() => _repository.openManageSubscription();
}
