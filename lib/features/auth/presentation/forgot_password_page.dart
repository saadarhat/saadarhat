import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/app_providers.dart';
import '../../../shared/widgets/auth_text_field.dart';
import '../../../shared/widgets/primary_button.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _email = TextEditingController();
  String? _feedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot password')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          AuthTextField(controller: _email, label: 'Email'),
          const SizedBox(height: 16),
          PrimaryButton(
            label: 'Send reset link',
            onPressed: () async {
              try {
                await ref.read(authControllerProvider.notifier).forgotPassword(_email.text.trim());
                setState(() => _feedback = 'Reset email sent.');
              } catch (_) {
                setState(() => _feedback = 'Unable to send reset email.');
              }
            },
          ),
          if (_feedback != null) Padding(padding: const EdgeInsets.only(top: 10), child: Text(_feedback!)),
        ]),
      ),
    );
  }
}
