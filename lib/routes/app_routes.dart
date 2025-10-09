import 'package:dumbell_cartel/features/AI%20Section/container/ai_screen_container.dart';
import 'package:dumbell_cartel/features/auth%20screens/sign%20in%20screen/container/sign_in_container.dart';
import 'package:dumbell_cartel/features/auth%20screens/sign%20up%20screen/container/sign_up_container.dart';
import 'package:dumbell_cartel/features/bottom%20nav%20bar/container/bottom_nav_bar_container.dart';
import 'package:dumbell_cartel/features/home%20screen/container/home_screen_container.dart';
import 'package:dumbell_cartel/features/profile%20screen/containers/profile_screen_container.dart';
import 'package:dumbell_cartel/features/splits%20detail%20screen/container/split_details_container.dart';
import 'package:dumbell_cartel/features/suggested%20workouts%20screen/container/suggested_workout_container.dart';
import 'package:dumbell_cartel/features/welcome%20screen/container/welcome_screen_container.dart';
import 'package:dumbell_cartel/features/workout%20instructions/container/tips_screen_container.dart';
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
    GoRoute(
      path: '/signup-screen',
      pageBuilder: (context, state) =>
          fadeTransitionPage(child: SignUpContainer()),
    ),

    // My Splits Detail Screen
    GoRoute(
      path: '/mysplit-screen',
      pageBuilder: (context, state) =>
          fadeTransitionPage(child: SplitDetailsContainer()),
    ),
  
    // Suggested workouts Screen
    GoRoute(
      path: '/suggestedworkouts-screen',
      pageBuilder: (context, state) =>
          fadeTransitionPage(child: SuggestedWorkoutContainer()),
    ),

    // Workout tips Screen
    GoRoute(
      path: '/workouttips-screen',
      pageBuilder: (context, state) =>
          fadeTransitionPage(child: TipsScreenContainer()),
    ),

    ShellRoute(
      builder: (context, state, child) {
        return BottomNavBarContainer(child: child);
      },
      routes: [
        // Home Screen
        GoRoute(
          path: '/home-screen',
          pageBuilder: (context, state) =>
              fadeTransitionPage(child: HomeScreenContainer()),
        ),

        // AI Screen
        GoRoute(
          path: '/ai-screen',
          pageBuilder: (context, state) =>
              fadeTransitionPage(child: AiScreenContainer()),
        ),

        // Profile Screen
        GoRoute(
          path: '/profile-screen',
          pageBuilder: (context, state) =>
              fadeTransitionPage(child: ProfileScreenContainer()),
        ),
      ],
    ),
  ],
);
