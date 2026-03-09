import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/constants/app_routes.dart';
import '../../../shared/providers/app_providers.dart';
import '../../../shared/widgets/auth_text_field.dart';
import '../../../shared/widgets/error_message.dart';
import '../../../shared/widgets/primary_button.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Log in')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(children: [
            AuthTextField(controller: _email, label: 'Email'),
            const SizedBox(height: 10),
            AuthTextField(controller: _password, label: 'Password', obscureText: true),
            const SizedBox(height: 20),
            if (state.error != null) ErrorMessage(state.error!),
            PrimaryButton(
              label: state.isLoading ? 'Loading...' : 'Log In',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await ref.read(authControllerProvider.notifier).login(_email.text.trim(), _password.text.trim());
                  if (mounted) context.go(AppRoutes.dashboard);
                }
              },
            ),
            TextButton(onPressed: () => context.go(AppRoutes.forgotPassword), child: const Text('Forgot password?')),
            TextButton(onPressed: () => context.go(AppRoutes.signup), child: const Text('No account? Sign up')),
          ]),
        ),
      ),
    );
  }
}
