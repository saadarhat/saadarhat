import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/app_providers.dart';
import '../../../shared/widgets/primary_button.dart';

class ManageSubscriptionPage extends ConsumerWidget {
  const ManageSubscriptionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(subscriptionControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Manage subscription')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Status: ${state.subscription.status.name}'),
          Text('Plan: ${state.subscription.plan.name}'),
          const SizedBox(height: 20),
          PrimaryButton(label: 'Open billing manager', onPressed: () => ref.read(subscriptionControllerProvider.notifier).manage()),
        ]),
      ),
    );
  }
}
