import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({super.key, required this.title, required this.subtitle, this.onTap});
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(title: Text(title), subtitle: Text(subtitle), onTap: onTap),
    );
  }
}
