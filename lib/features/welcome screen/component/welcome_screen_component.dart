import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';

import 'package:dumbell_cartel/common/widgets/reusable_button.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreenComponent extends ConsumerWidget {
  const WelcomeScreenComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);

    return Scaffold(
      backgroundColor: color.darkOverlay,

      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dumbell.jpg"),
                fit: BoxFit.cover,
                opacity: 0.50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 14.0,
              right: 14.0,
              bottom: 30.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),
                // Logo
                Image.asset("assets/images/dumbell_cartel.png", width: 100),

                Spacer(),

                // Text
                Column(
                  children: [
                    Align(
                      alignment: AlignmentGeometry.topLeft,
                      child: Text(
                        "The Dumbell Cartel!",
                        style: Fontstyles.roboto35px(context, ref),
                      ),
                    ),

                    SizedBox(height: 10.0),

                    Align(
                      alignment: AlignmentGeometry.topLeft,
                      child: Text(
                        "Personalized workouts, progress tracking, and expert guidance — all in one app. Your fitness coach, anytime, anywhere.",
                        style: Fontstyles.roboto15px(
                          context,
                          ref,
                        ).copyWith(wordSpacing: -1),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),

                // Get Started Button
                ReusableButton(
                  title: "Get started",
                  onPressed: () {
                    context.pushReplacement('/signin-screen');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
