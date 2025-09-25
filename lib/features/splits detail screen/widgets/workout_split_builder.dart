import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dumbell_cartel/utils/fontstyles/fontstyles.dart';
import 'package:dumbell_cartel/common/providers/theme_provider.dart';

class WorkoutSplitBuilder extends ConsumerWidget {
  final String muscleName;
  final String workoutName;
  final int numberOfWorkouts;
  final String reps;
  final String sets;
  const WorkoutSplitBuilder({
    super.key,
    required this.muscleName,
    required this.workoutName,
    required this.numberOfWorkouts,
    required this.reps,
    required this.sets,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(muscleName, style: Fontstyles.roboto25px(context, ref)),
        SizedBox(height: 10.0),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: color.textfieldBackground,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: color.textfieldBackground2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset("assets/images/chest_muscle.png"),
                ),
                SizedBox(width: 10.0),
                Text(
                  workoutName,
                  overflow: TextOverflow.ellipsis,
                  style: Fontstyles.roboto16pxSemiBold(
                    context,
                    ref,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  "${reps}x$sets",
                  style: Fontstyles.roboto16pxSemiBoldBlue(context, ref),
                ),
              ],
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 10.0),
          itemCount: numberOfWorkouts,
        ),
      ],
    );
  }
}
