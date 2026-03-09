import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/models/account_settings.dart';

class AccountState {
  const AccountState({this.settings = const AccountSettings()});
  final AccountSettings settings;
}

class AccountController extends StateNotifier<AccountState> {
  AccountController() : super(const AccountState());

  void updateNotifications(bool enabled) {
    state = AccountState(settings: state.settings.copyWith(pushNotifications: enabled));
  }
}
