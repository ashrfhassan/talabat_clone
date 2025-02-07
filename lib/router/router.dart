import 'package:go_router/go_router.dart';
import 'package:talabat_clone/pages/home.dart';

// GoRouter configuration
final GoRouter mainRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
  ],
);
