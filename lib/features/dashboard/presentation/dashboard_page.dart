import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/constants/app_routes.dart';
import '../../../shared/widgets/feature_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Welcome back', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const FeatureCard(title: 'Balance Score', subtitle: 'Your global score will appear here.'),
          FeatureCard(title: 'Sport', subtitle: 'Training, movement & progress', onTap: () => context.go(AppRoutes.sport)),
          FeatureCard(title: 'Nutrition', subtitle: 'Meals and habits', onTap: () => context.go(AppRoutes.nutrition)),
          FeatureCard(title: 'Relationships', subtitle: 'Connections and communication', onTap: () => context.go(AppRoutes.relationships)),
          FeatureCard(title: 'Religion', subtitle: 'Spiritual journey and routines', onTap: () => context.go(AppRoutes.religion)),
          FeatureCard(title: 'Premium Insights', subtitle: 'AI recommendations placeholder', onTap: () => context.go(AppRoutes.paywall)),
          FeatureCard(title: 'Account', subtitle: 'Manage profile and subscription', onTap: () => context.go(AppRoutes.account)),
        ],
      ),
    );
  }
}
