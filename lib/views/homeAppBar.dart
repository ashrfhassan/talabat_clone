import 'package:flutter/material.dart';
import 'package:talabat_clone/style/fonts.dart';
import 'package:talabat_clone/views/bottomModalSheet.dart';
import 'package:talabat_clone/widgets/wavyAppBarBottomBorder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  final double height = 130;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);

    return AppBar(
      shape: const WavyAppBarShape(),
      toolbarHeight: height,
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
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        showDragHandle: true,
                        builder: (BuildContext context) {
                          return BottomModalSheet();
                        },
                      );
                    },
                    iconAlignment: IconAlignment.end,
                    icon: const Icon(
                      Icons.expand_more,
                      size: 24,
                    ),
                    label: Text(
                      AppLocalizations.of(context)!.address('Rasha'),
                      style: fontNormalSubtitleWhiteHeavy,
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
                    },
                    icon: const Icon(Icons.search, size: 24),
                    label: Text(
                      AppLocalizations.of(context)!.search_input,
                      style: fontNormalTextGreyHeavy,
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
    );
  }
}
