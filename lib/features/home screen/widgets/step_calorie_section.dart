import 'package:dumbell_cartel/features/home%20screen/core/providers/home_screen_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class StepCalorieSection extends ConsumerWidget {
  const StepCalorieSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    final visibility = ref.watch(visibilityProvider);
    return Column(
      children: [
        // Steps
        Visibility(
          visible: !visibility,
          maintainState: true,
          maintainAnimation: true,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Steps covered", style: Fontstyles.roboto20px(context, ref)),
                    IconButton(
                      onPressed: () {
                        // Switch between Steps and Calories
                        ref.read(visibilityProvider.notifier).state = true;
                      },
                      icon: Icon(Icons.change_circle_rounded, size: 25, color: color.secondaryGradient2,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: CircularPercentIndicator(
                  radius: 120,
                  animation: true,
                  animationDuration: 700,
                  backgroundColor: color.textfieldBackground,
                  backgroundWidth: 12,
                  percent: 0.75,
                  progressColor: color.secondaryGradient1,
                  lineWidth: 50,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/steps.png",
                        width: 40,
                        color: color.secondaryGradient1,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "6123 Steps",
                        style: Fontstyles.roboto13px(context, ref),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        // Calories
        Visibility(
          visible: visibility,
          maintainState: true,
          maintainAnimation: true,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Calories burned", style: Fontstyles.roboto20px(context, ref)),
                    IconButton(
                      onPressed: () {
                        // Switch between Calories and Steps
                        ref.read(visibilityProvider.notifier).state = false;
                      },
                      icon: Icon(Icons.change_circle_rounded, size: 25),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: CircularPercentIndicator(
                  radius: 120,
                  animation: true,
                  animationDuration: 700,
                  backgroundColor: color.textfieldBackground,
                  backgroundWidth: 12,
                  percent: 0.5,
                  progressColor: color.secondaryGradient1,
                  lineWidth: 50,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/calories.png",
                        width: 40,
                        color: color.secondaryGradient1,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "123 Kcal",
                        style: Fontstyles.roboto13px(context, ref),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
