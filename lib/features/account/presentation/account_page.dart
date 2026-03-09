import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/constants/app_routes.dart';
import '../../../shared/providers/app_providers.dart';
import '../../../shared/widgets/subscription_badge.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);
    final sub = ref.watch(subscriptionControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(title: Text(auth.user?.fullName ?? 'User'), subtitle: Text(auth.user?.email ?? '')),
          SubscriptionBadge(status: sub.subscription.status),
          ListTile(title: const Text('Edit profile'), onTap: () {}),
          ListTile(title: const Text('Change password'), onTap: () {}),
          ListTile(title: const Text('Notification preferences'), onTap: () {}),
          ListTile(title: const Text('Language / theme'), onTap: () {}),
          ListTile(title: const Text('Manage subscription'), onTap: () => context.go(AppRoutes.manageSubscription)),
          ListTile(title: const Text('Delete account'), onTap: () {}),
          ListTile(
            title: const Text('Logout'),
            onTap: () async {
              await ref.read(authControllerProvider.notifier).logout();
              if (context.mounted) context.go(AppRoutes.login);
            },
          ),
        ],
      ),
    );
  }
}
