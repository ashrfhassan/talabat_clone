import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:talabat_clone/style/colors.dart';
import 'package:talabat_clone/style/fonts.dart';

class StartPage extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const StartPage({super.key, required this.navigationShell});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StartPageState();
}

class _StartPageState extends ConsumerState<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface, // Background color of the BottomNavigationBar
            boxShadow: [
              // This BoxShadow creates a shadow along the top edge.
              BoxShadow(
                color: Theme.of(context)
                    .colorScheme
                    .copyWith(
                      outline: light_boxShadow_color,
                    )
                    .outline,
                offset: const Offset(0, -1), // Negative offset to position the shadow above
                blurRadius: 1,
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: widget.navigationShell.currentIndex,
            onTap: (index) {
              widget.navigationShell.goBranch(index);
            },
            selectedItemColor: Theme.of(context).colorScheme.primary, // Color for the selected icon
            unselectedItemColor: grey_color,
            selectedLabelStyle: fontNormalTextBlackHeavy,
            unselectedLabelStyle: fontNormalTextBlackHeavy,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.document_scanner_outlined), label: 'Orders'),
              BottomNavigationBarItem(icon: Icon(Icons.work_outline_outlined), label: 'Offers'),
              BottomNavigationBarItem(icon: Icon(Icons.person_2), label: 'Account'),
            ],
          ),
        ),
      ),
    );
  }
}
