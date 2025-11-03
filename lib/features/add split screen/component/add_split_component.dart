import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/common/widgets/search_box.dart';
import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/common/widgets/reusable_textfields.dart';
import 'package:dumbell_cartel/common/widgets/reusable_workout_list_tile.dart';
import 'package:dumbell_cartel/common/providers/exercise_api_service_provider.dart';

class AddSplitComponent extends ConsumerWidget {
   const AddSplitComponent({super.key});
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final color = ref.watch(themeProvider);
    final searchResults = ref.watch(searchWorkoutProvider);
    final selectedWorkouts = ref.watch(selectedWorkoutsProvider);
    final TextEditingController searchController = TextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: color.background,
        appBar: AppBar(
          backgroundColor: color.background,
          title: Text(
            "Add a new split",
            style: Fontstyles.roboto16pxSemiBoldGreen(context, ref),
          ),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.save_rounded, color: color.secondaryGradient2),
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Split name",
                style: Fontstyles.roboto20px(
                  context,
                  ref,
                ).copyWith(color: color.secondaryGradient2),
              ),
              SizedBox(height: 10.0),
              ReusableTextfield(
                hinttext: 'Give your custom workout split a name!',
                icon: Icons.sports_gymnastics,
              ),
              SizedBox(height: 20.0),
              Text(
                "Split guide",
                style: Fontstyles.roboto20px(
                  context,
                  ref,
                ).copyWith(color: color.secondaryGradient2),
              ),
              SizedBox(height: 10.0),
              ReusableTextfield(
                hinttext: 'A guide on how to do this workout split',
                icon: Icons.tips_and_updates_rounded,
              ),
              SizedBox(height: 40.0),
              Text(
                'Add workouts',
                style: Fontstyles.roboto20px(
                  context,
                  ref,
                ).copyWith(color: color.secondaryGradient2),
              ),
              SizedBox(height: 10.0),

              // Search Workout
              SearchBox(
                cntrlr: searchController,
                onChanged: (value) =>
                    ref.read(searchQueryProvider.notifier).state = value,
              ),

              SizedBox(height: 20.0),

              // Search results
              searchResults.when(
                data: (exercises) {
                  if (exercises.isEmpty) return const SizedBox.shrink();
                  return Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: color.secondaryGradient1.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.builder(
                      itemCount: exercises.length,
                      itemBuilder: (context, index) {
                        final ex = exercises[index];
                        return ListTile(
                          leading: Image.asset(
                            'assets/images/workoutleading.png',
                            width: 40,
                          ),
                          title: Text(
                            ex.name.toUpperCase(),
                            style: Fontstyles.roboto16pxSemiBoldGreen(
                              context,
                              ref,
                            ),
                          ),
                          subtitle: Text(
                            'Target Muscle: ${ex.targetMuscle.toUpperCase()}',
                            style: Fontstyles.roboto13px(context, ref),
                          ),
                          onTap: () {
                            final notifier = ref.read(
                              selectedWorkoutsProvider.notifier,
                            );
                            if (!notifier.state.any((e) => e.id == ex.id)) {
                              notifier.state = [...notifier.state, ex];
                            }
                            ref.read(searchQueryProvider.notifier).state = '';
                            FocusScope.of(context).unfocus();
                          },
                        );
                      },
                    ),
                  );
                },
                error: (err, _) => Center(child: Text('Error: $err')),
                loading: () => Center(
                  child: CircularProgressIndicator(
                    color: color.secondaryGradient1,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final workout = selectedWorkouts[index];

                    return ReusableWorkoutListTile(
                      name: workout.name.toUpperCase(),

                      target: workout.targetMuscle.toUpperCase(),
                    );
                  },
                  itemCount: selectedWorkouts.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
