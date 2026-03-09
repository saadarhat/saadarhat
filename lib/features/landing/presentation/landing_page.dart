import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/constants/app_routes.dart';
import '../../../shared/widgets/primary_button.dart';
import '../../../shared/widgets/secondary_button.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF27104A), Color(0xFFB63DFF)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(radius: 40, child: Icon(Icons.spa, size: 40)),
                    const SizedBox(height: 16),
                    const Text('Équilibre Thérapie', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('Rééquilibrez votre vie: sport, nutrition, relations et spiritualité.'),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: const [Chip(label: Text('Sport')), Chip(label: Text('Nutrition')), Chip(label: Text('Relations')), Chip(label: Text('Spiritualité'))],
                    ),
                    const SizedBox(height: 32),
                    PrimaryButton(label: 'Sign Up', onPressed: () => context.go(AppRoutes.signup)),
                    const SizedBox(height: 12),
                    SecondaryButton(label: 'Log In', onPressed: () => context.go(AppRoutes.login)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
