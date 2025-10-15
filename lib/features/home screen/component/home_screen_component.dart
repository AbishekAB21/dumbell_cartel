import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_top_snackbar/flutter_top_snackbar.dart';
import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/features/home%20screen/widgets/my_split_list.dart';
import 'package:dumbell_cartel/features/home%20screen/widgets/suggested_workouts.dart';
import 'package:dumbell_cartel/features/home%20screen/widgets/user_welcome_section.dart';
import 'package:dumbell_cartel/features/home%20screen/widgets/step_calorie_section.dart';
import 'package:dumbell_cartel/features/auth%20screens/sign%20in%20screen/core/database/sign_in_db.dart';

class HomeScreenComponent extends ConsumerWidget {
  const HomeScreenComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: color.background,

      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: color.background,
        title: UserWelcomeSection(userName: "Abishek"),
        //centerTitle: false,
        actions: [
          IconButton(
            onPressed: () async {
              try {
                await SignInDb().signOutUser();
                if (context.mounted) {
                  context.go('/welcome-screen');
                
                // TODO: Fix this snackbar issue
                  FlutterTopSnackbar.show(
                    context,
                    "Logged out",
                    padding: EdgeInsets.all(15.0),
                    closeButtonSize: 10,
                    customIcon: Icons.info,
                    showCloseButton: false,
                    messageFontstyle: Fontstyles.roboto17Bold(context, ref),
                    borderRadius: 15.0,
                    animationType: AnimationTypes.slideFromTop,
                    elevation: 4,
                    customBackgroundColor: color.background,
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  FlutterTopSnackbar.show(
                    context,
                    "Error logging out",
                    padding: EdgeInsets.all(15.0),
                    closeButtonSize: 10,
                    customIcon: Icons.warning,
                    showCloseButton: false,
                    messageFontstyle: Fontstyles.roboto17Bold(context, ref),
                    borderRadius: 15.0,
                    animationType: AnimationTypes.slideFromTop,
                    elevation: 4,
                    customBackgroundColor: color.errorColor,
                  );
                }
              }
            },
            icon: Icon(Icons.logout_rounded, color: color.secondaryGradient2),
          ),
        ],
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Step - Calorie Section
              StepCalorieSection(),

              SizedBox(height: 15.0),

              // Workout logger Section
              MySplitList(),

              SizedBox(height: 25.0),

              // Suggested Workouts
              SuggestedWorkouts(),
            ],
          ),
        ),
      ),
    );
  }
}
