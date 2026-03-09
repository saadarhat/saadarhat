import 'package:flutter/material.dart';

import '../models/subscription_status.dart';

class SubscriptionBadge extends StatelessWidget {
  const SubscriptionBadge({super.key, required this.status});
  final SubscriptionStatus status;

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(status.name.toUpperCase()));
  }
}
