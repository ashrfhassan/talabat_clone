import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talabat_clone/state/user/auth_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talabat_clone/style/fonts.dart';
import 'package:talabat_clone/views/homeAppBar.dart';

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
      appBar: HomeAppBar(),
      body: AutoSizeText(
        'ThisIsAVeryLongWordhatNeedsBreakinghhhhhhhhhhhhhhhhhh444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444hhhhhhhhhhhhhh',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: fontNormalTextGrey,
      ),
    );
  }
}
