import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/common/widgets/search_box.dart';
import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';
import 'package:dumbell_cartel/common/widgets/reusable_textfields.dart';
import 'package:dumbell_cartel/common/widgets/reusable_workout_list_tile.dart';

class AddSplitComponent extends ConsumerWidget {
  AddSplitComponent({super.key});

  final List<String> items = [
    "Incline Chest Press",
    "Facepulls",
    "Leg Press",
    "Leg Extentions",
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
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
              SearchBox(onChanged: (value) {}),
              SizedBox(height: 20.0),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => ReusableWorkoutListTile(),
                  itemCount: 5,
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
