import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';

class CalorieStepsSection extends ConsumerWidget {
  const CalorieStepsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            CircleAvatar(
              backgroundColor: color.iconColor,
              radius: 30,
              child: ImageIcon(
                AssetImage("assets/images/calories.png"),
                color: color.secondaryGradient2,
                size: 30,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              "123 Kcal",
              style: Fontstyles.roboto16pxSemiBoldBlue(context, ref),
            ),
          ],
        ),
        SizedBox(width: 20.0),
        Column(
          children: [
            CircleAvatar(
              backgroundColor: color.iconColor,
              radius: 30,
              child: ImageIcon(
                AssetImage("assets/images/steps.png"),
                color: color.secondaryGradient2,
                size: 30,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              "6234 Steps",
              style: Fontstyles.roboto16pxSemiBoldBlue(context, ref),
            ),
          ],
        ),
      ],
    );
  }
}
