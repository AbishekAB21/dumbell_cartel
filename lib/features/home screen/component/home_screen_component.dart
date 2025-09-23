import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/features/home%20screen/widgets/step_calorie_section.dart';

class HomeScreenComponent extends ConsumerWidget {
  const HomeScreenComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: color.background,

      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: color.background,
        leading: CircleAvatar(
          radius: 50,
          backgroundColor: color.secondaryGradient1,
          // backgroundImage: ,
        ),

        title: Text(
          "Hello, Abishek",
          style: Fontstyles.roboto15px(context, ref),
        ),

        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Step - Calorie Section
            StepCalorieSection(),

            SizedBox(height: 30.0),

            // Workout logger Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Workout Log",
                style: Fontstyles.roboto20px(context, ref),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
