import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:talabat_clone/style/colors.dart';
import 'package:talabat_clone/style/fonts.dart';

class BottomModalSheet extends StatelessWidget {
  const BottomModalSheet({super.key});

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
                      child: const Icon(Icons.close, size: 21),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ]),
                  const SizedBox(height: 10),
                  Row(children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!.home_bottomSheet_headline,
                      style: fontHeadlineBlackHeavy,
                    )
                  ]),
                  Row(children: <Widget>[]),
                  Row(children: <Widget>[]),
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
