import 'package:dumbell_cartel/features/auth%20screens/sign%20in%20screen/container/sign_in_container.dart';
import 'package:dumbell_cartel/features/welcome%20screen/container/welcome_screen_container.dart';
import 'package:go_router/go_router.dart';

import 'package:dumbell_cartel/common/transitions/page_fade_transition.dart';
import 'package:dumbell_cartel/features/splash%20screen/container/splash_screen_container.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // Splash Screen Route
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          fadeTransitionPage(child: SplashScreenContainer()),
    ),

    // Welcome Screen Route
    GoRoute(
      path: '/welcome-screen',
      pageBuilder: (context, state) =>
          fadeTransitionPage(child: WelcomeScreenContainer()),
    ),

    // Sign in Screen
    GoRoute(
      path: '/signin-screen',
      pageBuilder: (context, state) =>
          fadeTransitionPage(child: SignInContainer()),
    ),

    // Sign Up Screen
  ],
);
