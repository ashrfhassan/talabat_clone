import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talabat_clone/state/user/auth_notifier.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talabat_clone/widgets/wavyAppBarBottomBorder.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late final SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  void _action() async {
    await ref.read(authNotifierProvider.notifier).updateAuth();
  }

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        shape: const WavyAppBarShape(),
        toolbarHeight: 130,
        backgroundColor: Theme.of(context).colorScheme.primary,
        flexibleSpace: Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min, // Column only takes the necessary space
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: TextButton.icon(
                      onPressed: () {
                        // Handle the button press
                        print("TextButton.icon pressed");
                      },
                      iconAlignment: IconAlignment.end,
                      icon: const Icon(
                        Icons.expand_more,
                        size: 24,
                      ),
                      label: Text(
                        AppLocalizations.of(context)!.address('Rasha'),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        iconColor: Theme.of(context).colorScheme.onPrimary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextButton.icon(
                      onPressed: () {
                        // Handle the button press
                        print("TextButton.icon pressed");
                      },
                      icon: const Icon(Icons.search, size: 24),
                      label: Text(
                        AppLocalizations.of(context)!.search_input,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.lerp(FontWeight.w300, FontWeight.w400, 0.5),
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        alignment: currentLocale.languageCode == 'ar' ? Alignment.centerRight : Alignment.centerLeft,
                        iconColor: Theme.of(context).colorScheme.onTertiary,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ).copyWith(
                        // Set overlayColor to transparent to disable the tap effect.
                        overlayColor: WidgetStateProperty.all(Colors.transparent),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Text('hi'),
    );
  }
}
