import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:logging/logging.dart';
import 'package:talabat_clone/router/router.dart';

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
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light, // light or dark for mobile them
          primary: Color.fromARGB(255, 255, 89, 0), // the background
          onPrimary: Color.fromARGB(255, 255, 255, 255), // on means on top of that background
          secondary: Color.fromARGB(255, 255, 89, 0),
          onSecondary: Color.fromARGB(255, 255, 255, 255),
          error: Colors.red.shade700,
          onError: Color.fromARGB(255, 255, 255, 255),
          surface: Color.fromARGB(255, 255, 255, 255),
          onSurface: Color.fromARGB(255, 38, 38, 38),
          outline: Color.fromARGB(255, 166, 166, 166),
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
          bodySmall: TextStyle(fontSize: 14, color: Colors.black54),
          labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white), // Button text
          labelSmall: TextStyle(fontSize: 12, color: Color.fromARGB(255, 166, 166, 166)),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark, // Switch to dark theme
          primary: Color.fromARGB(255, 200, 70, 0), // Darker shade of the primary color
          onPrimary: Color.fromARGB(255, 255, 255, 255), // White text/icons on primary
          secondary: Color.fromARGB(255, 200, 70, 0), // Darker shade for secondary
          onSecondary: Color.fromARGB(255, 255, 255, 255), // White text/icons on secondary
          error: Colors.red.shade400, // Slightly lighter red for better contrast in dark mode
          onError: Color.fromARGB(255, 0, 0, 0), // Dark text/icons on error color
          surface: Color.fromARGB(255, 28, 28, 28), // Dark background for surfaces (cards, dialogs)
          onSurface: Color.fromARGB(255, 255, 255, 255), // White text/icons on dark surface
          outline: Color.fromARGB(255, 100, 100, 100), // Darker outline for better contrast
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
          bodySmall: TextStyle(fontSize: 14, color: Colors.white60),
          labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black), // Button text
          labelSmall: TextStyle(fontSize: 12, color: Color.fromARGB(255, 166, 166, 166)),
        ),
      ),
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
