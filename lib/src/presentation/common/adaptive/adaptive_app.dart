import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_weakness/src/presentation/common/adaptive/adaptive_stateless_widget.dart';
import 'package:pokemon_weakness/src/settings/settings_controller.dart';

class AdaptiveApp extends AdaptiveStatelessWidget {
  const AdaptiveApp({
    this.restorationScopeId,
    this.localizationsDelegates,
    this.supportedLocales = const [Locale('en', '')],
    this.onGenerateTitle,
    required this.onGenerateRoute,
    required this.settingsController,
    super.key,
  });

  final String? restorationScopeId;
  final List<LocalizationsDelegate>? localizationsDelegates;
  final List<Locale> supportedLocales;
  final String Function(BuildContext)? onGenerateTitle;
  final Widget Function(BuildContext, RouteSettings) onGenerateRoute;
  final SettingsController settingsController;

  @override
  Widget buildCupertinoWidget(BuildContext context) => AnimatedBuilder(
        animation: settingsController,
        // A Material wrapper is required to avoid errors when using some widgets
        builder: (context, _) => Material(
          // Same goes to theme, the majority of text widgets will inherit from
          // material theme instead of cupertino
          child: Theme(
            data: _getMaterialThemeData(context),
            child: CupertinoApp(
              restorationScopeId: restorationScopeId,
              localizationsDelegates: localizationsDelegates,
              supportedLocales: supportedLocales,
              onGenerateTitle: onGenerateTitle,
              theme: _getCupertinoThemeData(context),
              onGenerateRoute: (settings) => CupertinoPageRoute(
                settings: settings,
                builder: (context) => onGenerateRoute(context, settings),
              ),
            ),
          ),
        ),
      );

  @override
  Widget buildMaterialWidget(BuildContext context) => AnimatedBuilder(
        animation: settingsController,
        builder: (context, _) => MaterialApp(
          restorationScopeId: restorationScopeId,
          localizationsDelegates: localizationsDelegates,
          supportedLocales: supportedLocales,
          onGenerateTitle: onGenerateTitle,
          theme: _getMaterialThemeData(context),
          onGenerateRoute: (settings) => MaterialPageRoute(
            settings: settings,
            builder: (context) => onGenerateRoute(context, settings),
          ),
        ),
      );

  CupertinoThemeData _getCupertinoThemeData(BuildContext context) {
    const lightTheme = CupertinoThemeData();
    const darkTheme = CupertinoThemeData(brightness: Brightness.dark);

    switch (settingsController.themeMode) {
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.light:
        return lightTheme;
      default:
        return MediaQuery.platformBrightnessOf(context) == ThemeMode.dark
            ? darkTheme
            : lightTheme;
    }
  }

  ThemeData _getMaterialThemeData(BuildContext context) {
    final lightTheme = ThemeData();
    final darkTheme = ThemeData.dark();

    switch (settingsController.themeMode) {
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.light:
        return lightTheme;
      default:
        return MediaQuery.platformBrightnessOf(context) == ThemeMode.dark
            ? darkTheme
            : lightTheme;
    }
  }
}
