import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/app_providers.dart';
import '../../../shared/widgets/feature_card.dart';
import '../../../shared/widgets/primary_button.dart';

class PaywallPage extends ConsumerWidget {
  const PaywallPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upgrade to Premium')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const FeatureCard(title: 'Premium Plan', subtitle: 'AI insights + all 4 pillars + smart tracking'),
          const SizedBox(height: 12),
          const FeatureCard(title: 'Trial', subtitle: 'Start with a trial, then choose monthly or yearly plans'),
          const Spacer(),
          PrimaryButton(label: 'Continue to payment', onPressed: () => ref.read(subscriptionControllerProvider.notifier).checkout()),
        ]),
      ),
    );
  }
}
