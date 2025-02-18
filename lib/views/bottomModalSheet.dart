import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:talabat_clone/state/addresses/addresses_notifier.dart';
import 'package:talabat_clone/style/fonts.dart';
import 'package:talabat_clone/style/spaces.dart';
import 'package:talabat_clone/widgets/addressBottomModalSheet.dart';
import 'package:talabat_clone/widgets/circleCloseButton.dart';

class BottomModalSheet extends ConsumerStatefulWidget {
  const BottomModalSheet({super.key});

  @override
  ConsumerState<BottomModalSheet> createState() => _BottomModalSheetState();
}

class _BottomModalSheetState extends ConsumerState<BottomModalSheet> {
  late final Future<SharedPreferences> _prefsFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the future once
    _prefsFuture = _combinedFuture();
  }

  Future<SharedPreferences> _combinedFuture() async {
    // Call loadAddresses() and wait for it to complete
    await ref.read(addressesNotifierProvider.notifier).loadAddresses();
    // Then get SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  @override
  Widget build(BuildContext context) {
    final addressesAsync = ref.watch(addressesNotifierProvider);

    return FutureBuilder<dynamic>(
      future: _prefsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // still loading
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        // Now we have the SharedPreferences instance
        final SharedPreferences prefs = snapshot.data!;

        return FractionallySizedBox(
          widthFactor: 1.0, // Occupies 100% of the screen width
          child: Align(
            heightFactor: 1.0,
            child: Container(
              margin: const EdgeInsets.only(left: 15.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: Theme.of(context).colorScheme.surface, // Background color of the BottomNavigationBar
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(children: <Widget>[
                    CircleCloseButton(
                      onPressed: () => Navigator.pop(context),
                    ),
                  ]),
                  SizedBox(height: small),
                  Row(children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.home_bottomSheet_headline,
                      style: fontHeadlineBlack,
                    ),
                  ]),
                  SizedBox(height: large),
                  Row(children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.home_bottomSheet_subtitle,
                      style: fontSubtitleBlack,
                    ),
                  ]),
                  SizedBox(height: large),
                  ...addressesAsync.when(
                    loading: () => [const Center(child: CircularProgressIndicator())],
                    error: (error, stackTrace) => [Text('Error: $error')],
                    data: (addresses) {
                      // Map each AddressEntity.
                      return addresses.map((address) => AddressBottomModalSheet(addressEntity: address)).toList();
                    },
                  ),
                  Row(children: <Widget>[]),
                  Row(children: <Widget>[]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
