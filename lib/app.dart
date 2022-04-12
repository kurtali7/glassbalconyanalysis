import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:glassbalconyanalysis/ui/route/routing_constans.dart';
import 'package:glassbalconyanalysis/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:glassbalconyanalysis/ui/route/router.dart' as router;
import 'package:localization/localization.dart';


class App extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    LocalJsonLocalization.delegate.directories = ['lib/i18n'];

    final theme =  ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    return MaterialApp(
      theme: theme.data,
      darkTheme: AppTheme.dark().data,
      themeMode: themeMode,
      onGenerateRoute: router.generateRoute,
      initialRoute: HomePageRoute,
      supportedLocales: [
        Locale('en', ''),
        Locale('tr', ''),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocalJsonLocalization.delegate,
      ],
    );
  }
}