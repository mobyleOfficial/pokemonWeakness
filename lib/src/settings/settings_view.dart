import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pokemon_weakness/src/presentation/common/adaptive/adaptive_scaffold.dart';
import 'package:pokemon_weakness/src/settings/settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      title: AppLocalizations.of(context)?.settingsPageTitle,
      body: Padding(
        padding: const EdgeInsets.all(16),
        // Glue the SettingsController to the theme selection DropdownButton.
        //
        // When a user selects a theme from the dropdown list, the
        // SettingsController is updated, which rebuilds the MaterialApp.
        child: DropdownButton<ThemeMode>(
          // Read the selected themeMode from the controller
          value: controller.themeMode,
          // Call the updateThemeMode method any time the user selects a theme.
          onChanged: controller.updateThemeMode,
          items: [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text(
                AppLocalizations.of(context)?.settingsSystemThemeOptionTitle ??
                    "",
              ),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text(
                AppLocalizations.of(context)?.settingsLightThemeOptionTitle ??
                    "",
              ),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text(
                AppLocalizations.of(context)?.settingsDarkThemeOptionTitle ??
                    "",
              ),
            )
          ],
        ),
      ),
    );
  }
}
