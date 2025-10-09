import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/features/splits%20detail%20screen/widgets/workout_split_builder.dart';

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
          style: Fontstyles.roboto16pxSemiBoldGreen(context, ref),
        ),
        centerTitle: false,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Split description
              Text(
                "Split Guide",
                style: Fontstyles.roboto20px(
                  context,
                  ref,
                ).copyWith(color: color.secondaryGradient1),
              ),
              SizedBox(height: 5.0),
              Text(
                "This is a two muscle a day split thus allowing you to hit the same muscle twice in a week. Chest-Back, Arms, Legs-Shoulders and repeat. 1 day rest.",
                style: Fontstyles.roboto16pxLight(context, ref),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 30.0),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
            ],
          ),
        ),
      ),
    );
  }
}
