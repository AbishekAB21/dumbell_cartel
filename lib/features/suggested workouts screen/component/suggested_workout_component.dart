import 'package:dumbell_cartel/features/suggested%20workouts%20screen/widgets/search_box.dart';
import 'package:dumbell_cartel/features/suggested%20workouts%20screen/widgets/workout_list_tile.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class SuggestedWorkoutComponent extends ConsumerWidget {
  const SuggestedWorkoutComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: color.background,

        appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor: color.background,
          iconTheme: IconThemeData(color: color.iconColor),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Chest Wokouts", style: Fontstyles.roboto25px(context, ref)),
              SizedBox(height: 10.0),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  decoration: BoxDecoration(
                    border: Border.all(color: color.textfieldBackground2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset("assets/images/chest_muscle.png"),
                ),
              ),

              SizedBox(height: 20.0),

              // Search section
              SearchBox(),

              SizedBox(height: 20.0),

              // List
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => WorkoutListTile(),
                  separatorBuilder: (context, index) => SizedBox(height: 10.0),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
