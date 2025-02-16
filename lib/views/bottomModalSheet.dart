import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:talabat_clone/style/colors.dart';
import 'package:talabat_clone/style/fonts.dart';
import 'package:talabat_clone/style/sizes.dart';
import 'package:talabat_clone/style/spaces.dart';
import 'package:auto_size_text/auto_size_text.dart';

class BottomModalSheet extends StatelessWidget {
  const BottomModalSheet({super.key});

  final int selectedAddressId = 1;

  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getPrefs(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // still loading
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // Now we have the SharedPreferences instance
        final prefs = snapshot.data!;

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
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(0, 0),
                        padding: EdgeInsets.all(7), // button padding
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        iconColor: Theme.of(context).colorScheme.onSurface,
                        shape: CircleBorder(),
                        side: BorderSide(
                          color: light_grey_color,
                          width: 0.7,
                        ),
                      ),
                      child: Icon(Icons.close, size: mediumSize),
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
                  Row(children: <Widget>[
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: outline_grey_color, // Border color
                              width: 1.0, // Border thickness
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.place, size: mediumSize),
                            Flexible(
                              // same as expanded
                              child: Padding(
                                padding: EdgeInsets.only(left: xSmall),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.home_bottomSheet_subtitle,
                                      style: fontNormalTextBlackHeavy,
                                    ),
                                    AutoSizeText(
                                      'ThisIsAVeryLongWordhatNeedsBreakinghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: fontNormalTextGrey,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (selectedAddressId == 1) ...[
                              Icon(
                                Icons.check_circle,
                                size: mediumSize,
                                color: Theme.of(context).colorScheme.primary,
                              )
                            ]
                          ],
                        ),
                      ),
                    )
                  ]),
                  Row(children: <Widget>[]),
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
