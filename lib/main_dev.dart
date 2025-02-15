import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logging/logging.dart';
import 'package:talabat_clone/router/router.dart';
import 'package:talabat_clone/style/dark.dart';
import 'package:talabat_clone/style/light.dart';

void main() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Locale deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      themeMode: ThemeMode.system,
      theme: LightTheme.light,
      darkTheme: DarkTheme.dark,
      locale: Locale(deviceLocale.languageCode), // en or ar
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (locale != null && supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first; // Default locale
      },
      routerConfig: mainRouter,
    );
  }
}
