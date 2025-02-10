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
  int _counter = 0;
  late final SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  void _incrementCounter() async {
    await ref.read(authNotifierProvider.notifier).updateAuth();
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const WavyAppBarShape(),
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          AppLocalizations.of(context)!.helloWorld('ahmed', 'mohamed'),
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Text('hi'),
    );
  }
}
