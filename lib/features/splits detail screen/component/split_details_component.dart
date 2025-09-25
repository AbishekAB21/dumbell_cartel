import 'package:dumbell_cartel/features/splits%20detail%20screen/widgets/workout_split_builder.dart';
import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class SplitDetailsComponent extends ConsumerWidget {
  const SplitDetailsComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: color.background,
      appBar: AppBar(
        backgroundColor: color.background,
        title: Text(
          "Push Pull Legs",
          style: Fontstyles.roboto16pxSemiBoldBlue(context, ref),
        ),
        centerTitle: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          itemBuilder: (context, index) => WorkoutSplitBuilder(
            muscleName: "Chest",
            workoutName: "Dumbell Chest Press",
            numberOfWorkouts: 3,
            reps: "15",
            sets: "3",
          ),
          itemCount: 7,
          separatorBuilder: (context, index) => SizedBox(height: 20.0),
        ),
      ),
    );
  }
}
