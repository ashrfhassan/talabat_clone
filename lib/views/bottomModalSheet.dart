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
  late final Future<SharedPreferences>? _prefsFuture;

  @override
  void initState() {
    super.initState();
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
          return FractionallySizedBox(
            widthFactor: 1.0, // Occupies 100% of the screen width
            child: Align(
              heightFactor: 1.0,
              child: SizedBox(
                height: 100,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          );
        }
        // handles _combinedFuture
        if (snapshot.hasError) {
          return FractionallySizedBox(
            widthFactor: 1.0, // Occupies 100% of the screen width
            child: Align(
              heightFactor: 1.0,
              child: SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    'Snapshot: ${AppLocalizations.of(context)!.errors_home_bottomSheet_load_addresses}',
                    style: fontNormalTextBlackHeavier,
                  ),
                ),
              ),
            ),
          );
        }
        // Now we have the SharedPreferences instance
        final SharedPreferences prefs = snapshot.data!;

        return addressesAsync.when(
          loading: () => FractionallySizedBox(
            widthFactor: 1.0, // Occupies 100% of the screen width
            child: Align(
              heightFactor: 1.0,
              child: SizedBox(
                height: 100,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
          error: (error, stackTrace) => FractionallySizedBox(
            widthFactor: 1.0, // Occupies 100% of the screen width
            child: Align(
              heightFactor: 1.0,
              child: SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.errors_home_bottomSheet_load_addresses,
                    style: fontNormalTextBlackHeavier,
                  ),
                ),
              ),
            ),
          ),
          data: (addresses) {
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
                      ...addresses.map((address) => AddressBottomModalSheet(addressEntity: address)),
                      Row(children: <Widget>[]),
                      Row(children: <Widget>[]),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
