import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talabat_clone/pages/home.dart';
import 'package:talabat_clone/pages/orders.dart';
import 'package:talabat_clone/pages/start.dart';

// Define GlobalKeys to ensure each branch maintains its state properly
final GlobalKey<NavigatorState> homeNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> ordersNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> offersNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> accountNavigatorKey =
    GlobalKey<NavigatorState>();

// GoRouter configuration
final GoRouter mainRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return StartPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: homeNavigatorKey,
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: ordersNavigatorKey,
          routes: [
            GoRoute(
              path: '/orders',
              builder: (context, state) => OrdersPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: offersNavigatorKey,
          routes: [
            GoRoute(
              path: '/offers',
              builder: (context, state) => HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: accountNavigatorKey,
          routes: [
            GoRoute(
              path: '/account',
              builder: (context, state) => HomePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
