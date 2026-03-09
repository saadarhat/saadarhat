import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_settings.freezed.dart';
part 'account_settings.g.dart';

@freezed
class AccountSettings with _$AccountSettings {
  const factory AccountSettings({
    @Default(true) bool pushNotifications,
    @Default('fr') String language,
    @Default('dark') String themeMode,
  }) = _AccountSettings;

  factory AccountSettings.fromJson(Map<String, dynamic> json) => _$AccountSettingsFromJson(json);
}
