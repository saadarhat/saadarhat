import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/constants/app_routes.dart';
import '../../../shared/providers/app_providers.dart';
import '../../../shared/widgets/auth_text_field.dart';
import '../../../shared/widgets/error_message.dart';
import '../../../shared/widgets/primary_button.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Create account')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(children: [
            AuthTextField(controller: _name, label: 'Full name', validator: (v) => (v == null || v.isEmpty) ? 'Required' : null),
            const SizedBox(height: 10),
            AuthTextField(controller: _email, label: 'Email', validator: (v) => (v != null && v.contains('@')) ? null : 'Invalid email'),
            const SizedBox(height: 10),
            AuthTextField(controller: _password, label: 'Password', obscureText: true, validator: (v) => (v != null && v.length >= 8) ? null : '8 chars min'),
            const SizedBox(height: 10),
            AuthTextField(controller: _confirm, label: 'Confirm password', obscureText: true, validator: (v) => v == _password.text ? null : 'Passwords do not match'),
            const SizedBox(height: 20),
            if (state.error != null) ErrorMessage(state.error!),
            PrimaryButton(
              label: state.isLoading ? 'Loading...' : 'Sign Up',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await ref.read(authControllerProvider.notifier).signUp(_name.text.trim(), _email.text.trim(), _password.text.trim());
                  if (mounted) context.go(AppRoutes.dashboard);
                }
              },
            ),
            TextButton(onPressed: () => context.go(AppRoutes.login), child: const Text('Already have an account? Log in')),
          ]),
        ),
      ),
    );
  }
}
